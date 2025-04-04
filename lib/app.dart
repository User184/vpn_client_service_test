import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_client_service_test/src/metrics_vpn/services/analytics_service.dart';
import 'package:vpn_client_service_test/src/vpn/services/vpn_service.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/blocs/vpn_bloc.dart';
import 'package:vpn_client_service_test/src/vpn/presentation/view/vpn_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<VpnService>(create: (context) => VpnService()),
            RepositoryProvider<AnalyticsService>(
              create: (context) => AnalyticsService(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<VpnBloc>(
                create: (context) => VpnBloc(
                  vpnService: context.read<VpnService>(),
                  analyticsService: context.read<AnalyticsService>(),
                ),
              ),
            ],
            child: MaterialApp(
              title: 'VPN Клиент',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(elevation: 6),
                ),
                cardTheme: CardTheme(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              home: const VpnScreen(),
            ),
          ),
        );
      },
    );
  }
}
