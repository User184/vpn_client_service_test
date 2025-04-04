class VpnConnection {
  final DateTime startTime;
  final DateTime? endTime;
  final bool isConnected;

  VpnConnection({
    required this.startTime,
    this.endTime,
    this.isConnected = true,
  });

  // Рассчитать продолжительность подключения
  Duration get duration {
    if (endTime != null) {
      return endTime!.difference(startTime);
    } else {
      return DateTime.now().difference(startTime);
    }
  }

  // Форматировать продолжительность в строку
  String get durationString {
    final duration = this.duration;
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  // Завершить подключение
  VpnConnection disconnect() {
    return VpnConnection(
      startTime: startTime,
      endTime: DateTime.now(),
      isConnected: false,
    );
  }

  // Конвертировать в Map для Firebase Analytics
  Map<String, dynamic> toMap() {
    return {
      'start_time': startTime.millisecondsSinceEpoch,
      'end_time': endTime?.millisecondsSinceEpoch,
      'duration': duration.inSeconds,
      'is_connected': isConnected,
    };
  }

  // Создать из Map (для хранения локально)
  factory VpnConnection.fromMap(Map<String, dynamic> map) {
    return VpnConnection(
      startTime: DateTime.fromMillisecondsSinceEpoch(map['start_time']),
      endTime:
          map['end_time'] != null
              ? DateTime.fromMillisecondsSinceEpoch(map['end_time'])
              : null,
      isConnected: map['is_connected'] ?? false,
    );
  }
}
