import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/views.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const LoginView();
      } else {
        return DashboardView();
      }
    },
  );
  static Handler register = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const RegisterView();
      } else {
        return DashboardView();
      }
    },
  );
}
