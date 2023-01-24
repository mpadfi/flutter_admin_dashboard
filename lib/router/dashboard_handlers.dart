import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/views.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DashboardView();
      } else {
        return const LoginView();
      }
    },
  );
}
