import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
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
  static String walletRoute = '/dashboard/wallet';
  static String storesRoute = '/dashboard/stores';

  static String iconsRoute = '/dashboard/icons';
  static String categoriesRoute = '/dashboard/categories';
  static String blankRoute = '/dashboard/blank';
  static String usersRoute = '/dashboard/users';
  static String userRoute = '/dashboard/users/:uid';

  static void configureRoutes() {
    //
    // Initial & Auth routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // dashboard
    router.define(dashboarRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.none);
    router.define(walletRoute, handler: DashboardHandlers.wallet, transitionType: TransitionType.none);
    router.define(storesRoute, handler: DashboardHandlers.stores, transitionType: TransitionType.none);

    router.define(categoriesRoute, handler: DashboardHandlers.categories, transitionType: TransitionType.none);
    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.none);
    router.define(blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.none);
    router.define(usersRoute, handler: DashboardHandlers.users, transitionType: TransitionType.none);
    router.define(userRoute, handler: DashboardHandlers.user, transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
