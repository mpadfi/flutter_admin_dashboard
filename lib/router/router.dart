import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  // inicialización de FluroRouter
  static final FluroRouter router = FluroRouter();

  // Initial path
  static String rootRoute = '/';
  // Auth paths
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';
  // Dashboard path
  static String dashboarRoute = '/dashboard';

  static void configureRoutes() {
    // Initial & Auth routes
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    // router.define(registerRoute, handler: handler);
    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
