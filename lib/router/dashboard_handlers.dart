import 'package:admin_dashboard/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidebar_provider.dart';

import 'package:admin_dashboard/ui/views/views.dart';

class DashboardHandlers {
  //
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.dashboarRoute);
      return (authStatus == AuthStatus.authenticated) ? DashboardView() : const LoginView();
    },
  );

  static Handler wallet = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.walletRoute);
      return (authStatus == AuthStatus.authenticated) ? WalletView() : const LoginView();
    },
  );

  static Handler stores = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.storesRoute);
      return (authStatus == AuthStatus.authenticated) ? StoresView() : const LoginView();
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);
      return (authStatus == AuthStatus.authenticated) ? IconsView() : const LoginView();
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankRoute);
      return (authStatus == AuthStatus.authenticated) ? BlankView() : const LoginView();
    },
  );
}
