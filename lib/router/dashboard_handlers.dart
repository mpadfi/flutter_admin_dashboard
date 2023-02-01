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
      return (authStatus == AuthStatus.authenticated) ? const DashboardView() : const LoginView();
    },
  );

  static Handler wallet = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.walletRoute);
      return (authStatus == AuthStatus.authenticated) ? const WalletView() : const LoginView();
    },
  );

  static Handler stores = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.storesRoute);
      return (authStatus == AuthStatus.authenticated) ? const StoresView() : const LoginView();
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);
      return (authStatus == AuthStatus.authenticated) ? const IconsView() : const LoginView();
    },
  );

  static Handler categories = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.categoriesRoute);
      return (authStatus == AuthStatus.authenticated) ? const CategoriesView() : const LoginView();
    },
  );

  static Handler users = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.usersRoute);
      return (authStatus == AuthStatus.authenticated) ? const UsersView() : const LoginView();
    },
  );

  static Handler user = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.userRoute);
      if (authStatus == AuthStatus.authenticated) {
        // Verificamos si viene el parámetro de la ruta uid
        if (parameters['uid']?.first != null) {
          return UserView(uid: parameters['uid']!.first);
        } else {
          return const UsersView();
        }
      } else {
        return const LoginView();
      }
      return null;
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, parameters) {
      final authStatus = Provider.of<AuthProvider>(context!).authStatus;
      Provider.of<SideBarProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankRoute);
      return (authStatus == AuthStatus.authenticated) ? const BlankView() : const LoginView();
    },
  );
}
