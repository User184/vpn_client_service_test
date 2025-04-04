import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/blocs/vpn_bloc.dart';

class ConnectionButton extends StatelessWidget {
  const ConnectionButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VpnBloc, VpnState>(
      builder: (context, state) {
        // Проверка статуса
        final bool isConnecting = state.status == ConnectionStatus.connecting;
        final bool isDisconnecting =
            state.status == ConnectionStatus.disconnecting;
        final bool isConnected = state.status == ConnectionStatus.connected;
        final bool isDisconnected =
            state.status == ConnectionStatus.disconnected;
        // Кнопка неактивна во время переходных состояний
        final bool isLoading = isConnecting || isDisconnecting;
        // Цвет кнопки
        final Color buttonColor = isConnected ? Colors.green : Colors.blue;
        log('[log] Button state: connected=$isConnected, loading=$isLoading, status=${state.status}');
        return Container(
          width: 60.w,
          height: 15.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: buttonColor.withValues(alpha: 0.3),
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    if (isConnected) {
                      context.read<VpnBloc>().add(const VpnEvent.disconnect());
                    } else if (isDisconnected) {
                      context.read<VpnBloc>().add(const VpnEvent.connect());
                    }
                  },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(5.w),
              backgroundColor: buttonColor,
              disabledBackgroundColor: Colors.grey,
            ),
            child: isLoading
                ? _RotatingIcon(
                    icon: Icons.settings,
                    color: Colors.white,
                    size: 15.w,
                  )
                : Icon(
                    isConnected ? Icons.power_settings_new : Icons.power_off,
                    size: 15.w,
                    color: Colors.white,
                  ),
          ),
        );
      },
    );
  }
}

// Виджет для вращающейся иконки
class _RotatingIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double size;

  const _RotatingIcon({
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<_RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14159,
          child: Icon(
            widget.icon,
            color: widget.color,
            size: widget.size,
          ),
        );
      },
    );
  }
}
