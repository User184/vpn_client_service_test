import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/blocs/vpn_bloc.dart';

class ConnectionTimer extends StatefulWidget {
  const ConnectionTimer({super.key});

  @override
  State<ConnectionTimer> createState() => _ConnectionTimerState();
}

class _ConnectionTimerState extends State<ConnectionTimer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VpnBloc, VpnState>(
      builder: (context, state) {
        if (state.status != ConnectionStatus.connected ||
            state.currentConnection == null) {
          return SizedBox(height: 14.h);
        }

        // Вычисление текущей продолжительности соединения
        final duration =
            DateTime.now().difference(state.currentConnection!.startTime);
        final hours = duration.inHours.toString().padLeft(2, '0');
        final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
        final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
        final durationString = '$hours:$minutes:$seconds';

        return Container(
          padding: EdgeInsets.all(4.w),
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(2.w),
            border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              Text(
                'Время подключения',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 1.h),
              _TimerDisplay(durationString: durationString),
            ],
          ),
        );
      },
    );
  }
}

// Отдельный виджет для отображения времени с автообновлением
class _TimerDisplay extends StatefulWidget {
  final String durationString;

  const _TimerDisplay({required this.durationString});

  @override
  State<_TimerDisplay> createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<_TimerDisplay> {
  late String _displayTime;

  @override
  void initState() {
    super.initState();
    _displayTime = widget.durationString;
  }

  @override
  void didUpdateWidget(_TimerDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.durationString != widget.durationString) {
      _displayTime = widget.durationString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28.w,
      child: Text(
        _displayTime,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.green,
          fontFamily: 'Monospace',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
