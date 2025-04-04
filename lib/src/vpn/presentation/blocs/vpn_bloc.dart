import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vpn_client_service_test/src/metrics_vpn/services/analytics_service.dart';
import 'package:vpn_client_service_test/src/vpn/services/vpn_service.dart';
import 'package:vpn_client_service_test/src/vpn/domain/entities/vpn_connection.dart';

part 'vpn_bloc.freezed.dart';

enum ConnectionStatus { disconnected, connecting, connected, disconnecting }

@freezed
class VpnEvent with _$VpnEvent {
  const VpnEvent._();
  const factory VpnEvent.connect() = _Connect;
  const factory VpnEvent.disconnect() = _Disconnect;
  const factory VpnEvent.refresh() = _Refresh;
  const factory VpnEvent.loadConnectionHistory() = _LoadHistory;
}

@freezed
abstract class VpnState with _$VpnState {
  const VpnState._();
  const factory VpnState.valueObject({
    @Default(ConnectionStatus.disconnected) ConnectionStatus status,
    VpnConnection? currentConnection,
    List<VpnConnection>? connectionHistory,
    String? errorMessage,
  }) = _State;
}

class VpnBloc extends Bloc<VpnEvent, VpnState> {
  final VpnService _vpnService;
  final AnalyticsService _analyticsService;
  Timer? _connectionTimer;

  VpnBloc({
    required VpnService vpnService,
    required AnalyticsService analyticsService,
  })  : _vpnService = vpnService,
        _analyticsService = analyticsService,
        super(VpnState.valueObject()) {
    on<_Connect>(_onConnect);
    on<_Disconnect>(_onDisconnect);
    on<_Refresh>(_onRefreshStatus);
    on<_LoadHistory>(_onLoadConnectionHistory);

    // Загрузка истории при инициализации
    add(const VpnEvent.loadConnectionHistory());
  }

  // Обработчик для загрузки истории подключений
  Future<void> _onLoadConnectionHistory(
      _LoadHistory event, Emitter<VpnState> emit) async {
    final connections = await _vpnService.getConnections();
    emit(state.copyWith(connectionHistory: connections));
  }

  Future<void> _onConnect(_Connect event, Emitter<VpnState> emit) async {
    if (state.status == ConnectionStatus.connecting ||
        state.status == ConnectionStatus.connected) {
      return;
    }

    emit(state.copyWith(status: ConnectionStatus.connecting));

    try {
      // Попытка подключиться
      final success = await _vpnService.connect();

      if (success) {
        // Создается новое подключение
        final connection = VpnConnection(startTime: DateTime.now());

        // Отправка события в аналитику
        await _analyticsService.logConnectionEvent(connection);

        emit(
          state.copyWith(
            status: ConnectionStatus.connected,
            currentConnection: connection,
          ),
        );

        // Запуск таймера для обновления состояния
        _startConnectionTimer();
      } else {
        // Обработка ошибки подключения
        emit(
          state.copyWith(
            status: ConnectionStatus.disconnected,
            errorMessage: 'Failed to connect to VPN',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ConnectionStatus.disconnected,
          errorMessage: 'Error: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onDisconnect(_Disconnect event, Emitter<VpnState> emit) async {
    if (state.status != ConnectionStatus.connected) return;

    emit(state.copyWith(status: ConnectionStatus.disconnecting));

    try {
      // Попытка отключиться
      final success = await _vpnService.disconnect();

      if (success) {
        // Остановка таймера
        _stopConnectionTimer();

        // Завершение текущего подключения
        final completedConnection = state.currentConnection!.disconnect();

        // Добавление в историю
        final updatedHistory = List<VpnConnection>.from(
          state.connectionHistory ?? [],
        )..add(completedConnection);

        // Сохраняем в хранилище
        await _vpnService.saveConnection(completedConnection);

        // Отправка события в аналитику
        await _analyticsService.logDisconnectionEvent(completedConnection);

        emit(
          state.copyWith(
            status: ConnectionStatus.disconnected,
            currentConnection: null,
            connectionHistory: updatedHistory,
          ),
        );
      } else {
        // Ошибка отключения
        emit(
          state.copyWith(
            errorMessage: 'Failed to disconnect from VPN',
            status: ConnectionStatus.connected,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Error: ${e.toString()}',
          status: ConnectionStatus.connected,
        ),
      );
    }
  }

  // Обновление таймера подключения
  void _onRefreshStatus(_Refresh event, Emitter<VpnState> emit) {
    if (state.status == ConnectionStatus.connected &&
        state.currentConnection != null) {
      // Создается новое соединение с тем же временем начала
      final updatedConnection = VpnConnection(
        startTime: state.currentConnection!.startTime,
        isConnected: true,
      );

      emit(
        state.copyWith(
          status: ConnectionStatus.connected,
          currentConnection: updatedConnection,
        ),
      );
    }
  }

  // Запуск таймера подключения
  void _startConnectionTimer() {
    _connectionTimer?.cancel();
    _connectionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(VpnEvent.refresh());
    });
  }

  // Остановка таймера
  void _stopConnectionTimer() {
    _connectionTimer?.cancel();
    _connectionTimer = null;
  }

  @override
  Future<void> close() {
    _stopConnectionTimer();
    return super.close();
  }
}
