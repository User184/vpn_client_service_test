import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:vpn_client_service_test/src/metrics_vpn/services/analytics_service.dart';
import 'package:vpn_client_service_test/src/vpn/domain/entities/vpn_connection.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/blocs/vpn_bloc.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/view/connection_history.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    // Логирование просмотра экрана аналитики
    context.read<AnalyticsService>().logScreenView('AnalyticsScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аналитика подключений'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // График активности
          Container(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Заголовок раздела
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  child: Text(
                    'График активности',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                // График подключений
                SizedBox(
                  height: 30.h,
                  child: BlocBuilder<VpnBloc, VpnState>(
                    builder: (context, state) {
                      if (state.connectionHistory == null) {
                        return Center(
                          child: Text(
                            'Нет данных для отображения',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        );
                      }

                      return _buildConnectionChart(
                          state.connectionHistory ?? []);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Заголовок раздела истории (также фиксированный)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
            child: Text(
              'История подключений',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),

          // История подключений
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: const ConnectionHistory(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionChart(List<VpnConnection> connections) {
    // Если менее 2 подключений, график строить бессмысленно
    if (connections.length < 2) {
      return Center(
        child: Text(
          'Недостаточно данных для графика',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
      );
    }

    // Сортировка подключений по времени
    final sortedConnections = List<VpnConnection>.from(connections)
      ..sort((a, b) => a.startTime.compareTo(b.startTime));

    // Создание точек для графика
    final spots = <FlSpot>[];

    for (var i = 0; i < sortedConnections.length; i++) {
      final connection = sortedConnections[i];
      // Используем индекс как X и продолжительность в минутах как Y
      spots.add(
        FlSpot(
          i.toDouble(),
          connection.duration.inSeconds / 60, // Переводим в минуты
        ),
      );
    }

    // Получаем уникальные значения минут для оси Y
    final maxY = _getMaxDuration(sortedConnections);
    final interval = _calculateOptimalInterval(maxY);
    final Set<int> visibleYValues = {};

    // Высчитываем интервалы делений для оси Y
    for (double i = 0; i <= maxY; i += interval) {
      visibleYValues.add(i.toInt());
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            horizontalInterval: interval,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withValues(alpha: 0.3),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.withValues(alpha: 0.3),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, t) {
                  // Получаем индекс точки
                  final index = value.toInt();

                  if (index >= 0 && index < sortedConnections.length) {
                    // Получаем текущую дату для этой точки
                    final date = sortedConnections[index].startTime;
                    final dateStr = DateFormat('dd.MM').format(date);

                    // Показываем метку, если это первая точка
                    if (index == 0) {
                      return SideTitleWidget(
                        meta: t,
                        child: Text(
                          dateStr,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      );
                    }

                    // Показываем метку, если это последняя точка с уникальной датой
                    // (ищем следующие точки с такой же датой)
                    if (index == sortedConnections.length - 1) {
                      return SideTitleWidget(
                        meta: t,
                        child: Text(
                          dateStr,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      );
                    } else {
                      // Проверяем, является ли эта точка последней с уникальной датой
                      // (посмотрим, отличается ли следующая точка по дате)
                      final nextDate = sortedConnections[index + 1].startTime;
                      final nextDateStr = DateFormat('dd.MM').format(nextDate);

                      if (dateStr != nextDateStr && index != 0) {
                        return SideTitleWidget(
                          meta: t,
                          child: Text(
                            dateStr,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.grey[700],
                            ),
                          ),
                        );
                      }
                    }
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 45, // Увеличиваем резервированное место
                interval: interval, // Устанавливаем интервал
                getTitlesWidget: (value, t) {
                  // Показываем только целые значения и только для уникальных точек
                  if (value % 1 == 0 &&
                      visibleYValues.contains(value.toInt()) &&
                      value != 0) {
                    return SideTitleWidget(
                      meta: t,
                      space: 8, // Отступ текста от оси
                      child: Text(
                        '${value.toInt()}м', // Сокращаем "мин" до "м"
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
          ),
          minX: 0,
          maxX: (sortedConnections.length - 1).toDouble(),
          minY: 0,
          maxY: maxY,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.blue,
                    strokeWidth: 1,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withValues(alpha: 0.3),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withValues(alpha: 0.1),
                    Colors.blue.withValues(alpha: 0.3),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Получение максимальной продолжительности для графика (с запасом)
  double _getMaxDuration(List<VpnConnection> connections) {
    double maxDuration = 0;
    for (final connection in connections) {
      final durationMinutes = connection.duration.inSeconds / 60;
      if (durationMinutes > maxDuration) {
        maxDuration = durationMinutes;
      }
    }

    return maxDuration * 1.2;
  }

  // Вычисление оптимального интервала для делений оси Y
  double _calculateOptimalInterval(double maxValue) {
    // Необходимо от 4 до 8 делений на оси Y
    if (maxValue <= 5) return 1; // Для малых значений - шаг 1 минута
    if (maxValue <= 10) return 2; // Шаг 2 минуты
    if (maxValue <= 30) return 5; // Шаг 5 минут
    if (maxValue <= 60) return 10; // Шаг 10 минут
    if (maxValue <= 120) return 20; // Шаг 20 минут
    return 30; // Для больших значений - шаг 30 минут
  }
}
