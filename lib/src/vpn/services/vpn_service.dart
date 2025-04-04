import 'dart:async';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_client_service_test/src/vpn/domain/entities/vpn_connection.dart';
import 'dart:convert';

class VpnService {
  // Делаем константу публичной для доступа из тестов
  static const String connectionsKey = 'vpn_connections';

  // Подключение к VPN сервису
  Future<bool> connect() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  // Отключение от VPN сервиса
  Future<bool> disconnect() async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  // Сохранение информации о подключении
  Future<void> saveConnection(VpnConnection connection) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> existingData =
          prefs.getStringList(connectionsKey) ?? [];

      // Преобразование объекта в JSON и добавление в список
      existingData.add(jsonEncode(connection.toMap()));

      // Сохраняются только последние 5 подключений
      if (existingData.length > 5) {
        existingData.removeAt(0);
      }

      await prefs.setStringList(connectionsKey, existingData);
    } catch (e) {
      log('Error saving connection: $e');
    }
  }

  // Загружаем историю подключений
  Future<List<VpnConnection>> getConnections() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> data = prefs.getStringList(connectionsKey) ?? [];

      return data.map((string) {
        final Map<String, dynamic> map = jsonDecode(string);
        return VpnConnection.fromMap(map);
      }).toList();
    } catch (e) {
      log('Error loading connections: $e');
      return [];
    }
  }
}
