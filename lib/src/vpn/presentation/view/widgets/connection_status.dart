import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/blocs/vpn_bloc.dart';

class ConnectionStatusWidget extends StatelessWidget {
  const ConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VpnBloc, VpnState>(
      builder: (context, state) {
        String statusText;
        Color statusColor;

        switch (state.status) {
          case ConnectionStatus.connected:
            statusText = 'Подключено';
            statusColor = Colors.green;
            break;
          case ConnectionStatus.connecting:
            statusText = 'Подключение...';
            statusColor = Colors.orange;
            break;
          case ConnectionStatus.disconnecting:
            statusText = 'Отключение...';
            statusColor = Colors.orange;
            break;
          case ConnectionStatus.disconnected:
            statusText = 'Отключено';
            statusColor = Colors.red;
            break;
        }

        return Column(
          children: [
            Text(
              statusText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
            SizedBox(height: 1.h),
            if (state.errorMessage != null)
              Container(
                padding: EdgeInsets.all(2.w),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: Text(
                  state.errorMessage!,
                  style: TextStyle(fontSize: 12.sp, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        );
      },
    );
  }
}
