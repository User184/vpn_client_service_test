import 'dart:developer';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:vpn_client_service_test/src/vpn/domain/entities/vpn_connection.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Логирование события подключения
  Future<void> logConnectionEvent(VpnConnection connection) async {
    try {
      final formattedTimestamp = _formatTimestamp(connection.startTime);

      await _analytics.logEvent(
        name: 'vpn_connected',
        parameters: {
          'timestamp': formattedTimestamp,
        },
      );
    } catch (e) {
      log('Error logging connection event: $e');
    }
  }

  // Логирование события отключения
  Future<void> logDisconnectionEvent(VpnConnection connection) async {
    try {
      final formattedStartTime = _formatTimestamp(connection.startTime);
      final formattedEndTime = _formatTimestamp(connection.endTime!);

      // Конвертация длительности из секунд в минуты и округление до 2 знаков после запятой
      final durationMinutes =
          (connection.duration.inSeconds / 60).toStringAsFixed(2);

      await _analytics.logEvent(
        name: 'vpn_disconnected',
        parameters: {
          'start_time': formattedStartTime,
          'end_time': formattedEndTime,
          'duration_minutes': durationMinutes,
        },
      );
    } catch (e) {
      log('Error logging disconnection event: $e');
    }
  }

  // Логирование просмотра экрана аналитики
  Future<void> logScreenView(String screenName) async {
    try {
      await _analytics.logScreenView(
        screenName: screenName,
        screenClass: screenName,
      );
    } catch (e) {
      log('Error logging screen view: $e');
    }
  }

  // Вспомогательный метод для форматирования временной метки
  String _formatTimestamp(DateTime dateTime) {
    return "${dateTime.year}-${_padZero(dateTime.month)}-${_padZero(dateTime.day)} ${_padZero(dateTime.hour)}:${_padZero(dateTime.minute)}:${_padZero(dateTime.second)}";
  }

  // Вспомогательный метод для добавления ведущего нуля
  String _padZero(int value) {
    return value.toString().padLeft(2, '0');
  }
}
