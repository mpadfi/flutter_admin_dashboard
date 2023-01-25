import 'package:admin_dashboard/providers/sidebar_provider.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // lazy en false para que empieze el proceso de autentificación // true seria bajo demanda
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideBarProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {
        //
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return SpalshLayout();
        }

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashBoardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
        ),
      ),
    );
  }
}
