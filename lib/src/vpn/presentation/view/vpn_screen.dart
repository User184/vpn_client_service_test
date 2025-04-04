import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_client_service_test/src/metrics_vpn/services/analytics_service.dart';
import 'package:vpn_client_service_test/src/metrics_vpn/presentation/view/analytics_screen.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/view/widgets/connection_button.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/view/widgets/connection_status.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/view/widgets/connection_timer.dart';

class VpnScreen extends StatefulWidget {
  const VpnScreen({super.key});

  @override
  State<VpnScreen> createState() => _VpnScreenState();
}

class _VpnScreenState extends State<VpnScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AnalyticsService>().logScreenView('VpnScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VPN Клиент'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.analytics,
              size: 26,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnalyticsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
              // Статус подключения
              const ConnectionStatusWidget(),
              SizedBox(height: 2.h),
              // Таймер подключения
              const ConnectionTimer(),
              SizedBox(height: 6.h),
              // Кнопка подключения
              const ConnectionButton(),
              SizedBox(height: 6.h),
              // Описание
              Container(
                padding: EdgeInsets.all(4.w),
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: Text(
                  'Нажмите на кнопку, чтобы подключиться к защищенному VPN-серверу. '
                  'После подключения ваш интернет-трафик будет защищен.',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
