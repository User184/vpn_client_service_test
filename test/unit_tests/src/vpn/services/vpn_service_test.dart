import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_client_service_test/src/vpn/domain/entities/vpn_connection.dart';
import 'dart:convert';

import 'package:vpn_client_service_test/src/vpn/services/vpn_service.dart';

void main() {
  late VpnService vpnService;

  const String connectionsKey = 'vpn_connections';

  setUp(() {
    vpnService = VpnService();
  });

  group('VpnService Tests', () {
    test('connect should return true after delay', () async {
      // Проверка, что метод connect возвращает true
      final result = await vpnService.connect();
      expect(result, true);
    });

    test('disconnect should return true after delay', () async {
      // Проверка, что метод disconnect возвращает true
      final result = await vpnService.disconnect();
      expect(result, true);
    });

    test('saveConnection should save connection to SharedPreferences',
        () async {
      // Подготовка
      SharedPreferences.setMockInitialValues({});
      final testConnection = VpnConnection(
        startTime: DateTime(2023, 1, 1, 10, 0),
        endTime: DateTime(2023, 1, 1, 11, 0),
        isConnected: false,
      );

      // Действие
      await vpnService.saveConnection(testConnection);

      // Получение значения из SharedPreferences для проверки
      final prefs = await SharedPreferences.getInstance();
      final savedConnections = prefs.getStringList(connectionsKey);

      // Проверка
      expect(savedConnections, isNotNull);
      expect(savedConnections!.length, 1);

      // Проверка содержимого сохраненного соединения
      final savedConnection = jsonDecode(savedConnections.first);
      expect(savedConnection['start_time'],
          equals(testConnection.startTime.millisecondsSinceEpoch));
      expect(savedConnection['end_time'],
          equals(testConnection.endTime?.millisecondsSinceEpoch));
    });

    test('saveConnection should limit history to 5 items', () async {
      // Подготовка
      final now = DateTime.now();

      // Создаются 5 старых подключений, которые уже "сохранены"
      final oldConnections = List.generate(
          5,
          (index) => jsonEncode(VpnConnection(
                startTime: now.subtract(Duration(days: 5 - index)),
                endTime: now.subtract(Duration(days: 5 - index, hours: -1)),
                isConnected: false,
              ).toMap()));

      // Устанавливка начальных значений в SharedPreferences
      SharedPreferences.setMockInitialValues({
        connectionsKey: oldConnections,
      });

      // Создается новое подключение
      final newConnection = VpnConnection(
        startTime: now,
        endTime: now.add(const Duration(hours: 1)),
        isConnected: false,
      );

      // Действие
      await vpnService.saveConnection(newConnection);

      // Получение значения из SharedPreferences для проверки
      final prefs = await SharedPreferences.getInstance();
      final savedConnections = prefs.getStringList(connectionsKey);

      // Проверка
      expect(savedConnections, isNotNull);
      expect(savedConnections!.length, 5);

      // Проверка, что первый элемент не самый старый (он должен быть удален)
      final firstSavedItem = jsonDecode(savedConnections.first);
      final firstStartTime =
          DateTime.fromMillisecondsSinceEpoch(firstSavedItem['start_time']);
      expect(firstStartTime.day,
          isNot(equals(now.subtract(Duration(days: 5)).day)));

      // Проверка, что последний элемент - новый добавленный
      final lastSavedItem = jsonDecode(savedConnections.last);
      final lastStartTime =
          DateTime.fromMillisecondsSinceEpoch(lastSavedItem['start_time']);
      expect(lastStartTime.day, equals(now.day));
      expect(lastStartTime.hour, equals(now.hour));
    });

    test('getConnections should return empty list when no data is stored',
        () async {
      // Устанавливка пустых начальных значений
      SharedPreferences.setMockInitialValues({});

      // Действие
      final connections = await vpnService.getConnections();

      // Проверка
      expect(connections, isEmpty);
    });

    test('getConnections should deserialize connections from SharedPreferences',
        () async {
      // Подготовка
      final now = DateTime.now();
      final connection1 = VpnConnection(
        startTime: now.subtract(const Duration(hours: 2)),
        endTime: now.subtract(const Duration(hours: 1)),
        isConnected: false,
      );
      final connection2 = VpnConnection(
        startTime: now.subtract(const Duration(hours: 1)),
        endTime: now,
        isConnected: false,
      );

      final storedConnections = [
        jsonEncode(connection1.toMap()),
        jsonEncode(connection2.toMap()),
      ];

      // Устанавка начальных значений в SharedPreferences
      SharedPreferences.setMockInitialValues({
        connectionsKey: storedConnections,
      });

      // Действие
      final connections = await vpnService.getConnections();

      // Проверка
      expect(connections.length, 2);
      expect(connections[0].startTime.millisecondsSinceEpoch,
          connection1.startTime.millisecondsSinceEpoch);
      expect(connections[1].startTime.millisecondsSinceEpoch,
          connection2.startTime.millisecondsSinceEpoch);
    });

    test('getConnections should handle invalid data gracefully', () async {
      // Подготовка с некорректными данными
      SharedPreferences.setMockInitialValues({
        connectionsKey: ['not valid json'],
      });

      // Действие
      final connections = await vpnService.getConnections();

      // Проверка - должен вернуться пустой список, без исключений
      expect(connections, isEmpty);
    });
  });
}
