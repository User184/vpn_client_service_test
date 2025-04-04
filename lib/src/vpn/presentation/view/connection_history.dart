import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_client_service_test/src/vpn/domain/entities/vpn_connection.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/blocs/vpn_bloc.dart';

class ConnectionHistory extends StatefulWidget {
  const ConnectionHistory({super.key});

  @override
  State<ConnectionHistory> createState() => _ConnectionHistoryState();
}

class _ConnectionHistoryState extends State<ConnectionHistory>
    with TickerProviderStateMixin {
  // Контроллеры анимации для карточек
  final List<AnimationController> _cardControllers = [];
  final List<Animation<double>> _cardAnimations = [];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return BlocBuilder<VpnBloc, VpnState>(
      builder: (context, state) {
        final connections = state.connectionHistory ?? [];

        if (connections.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Text(
                'Нет истории подключений',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        }

        // Только последние 5 подключений
        final limitedConnections = connections.length <= 5
            ? connections
            : connections.sublist(connections.length - 5);

        // Инициализация контроллеров анимации, если их количество изменилось
        if (_cardControllers.length != limitedConnections.length) {
          // Сначала очищаются старые контроллеры
          for (var controller in _cardControllers) {
            controller.dispose();
          }
          _cardControllers.clear();
          _cardAnimations.clear();

          // Создаются новые контроллеры для каждой карточки
          for (int i = 0; i < limitedConnections.length; i++) {
            final controller = AnimationController(
              duration: const Duration(milliseconds: 500),
              vsync: this,
            );

            final animation = CurvedAnimation(
              parent: controller,
              curve: Curves.easeInOut,
            );

            _cardControllers.add(controller);
            _cardAnimations.add(animation);

            // Запуск анимации с задержкой
            Future.delayed(Duration(milliseconds: 100 * i), () {
              if (mounted) {
                controller.forward();
              }
            });
          }
        }

        return SafeArea(
          bottom: true,
          minimum: EdgeInsets.only(bottom: 2.h),
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: bottomPadding + 3.h),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: limitedConnections.length,
            itemBuilder: (context, index) {
              // Отображаем элементы в обратном порядке (новые сверху)
              final actualIndex = limitedConnections.length - 1 - index;
              final connection = limitedConnections[actualIndex];

              // Анимация для текущей карточки
              final animation = index < _cardAnimations.length
                  ? _cardAnimations[index]
                  : null;

              // Если анимация еще не создана, показываем карточку без анимации
              if (animation == null) {
                return _buildConnectionItem(connection);
              }

              // Применяем анимацию к карточке
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(animation),
                  child: _buildConnectionItem(connection),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildConnectionItem(VpnConnection connection) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');

    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Row(
          children: [
            Container(
              width: 3.w,
              height: 3.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: connection.isConnected ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateFormat.format(connection.startTime),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    'Длительность: ${connection.durationString}',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.access_time,
              size: 6.w,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
