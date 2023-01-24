import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  //
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuth();
  }

  login(String email, String password) {
    // todo PETICIÓN HTTP
    _token = 'añlsdkjfñasldkfjañlsdkfjñalskdjfñlkjasñlkjd.añlskdfjañsd';
    LocalStorage.prefs.setString('token', _token!);

    // Navegar al dashboard porque cambia el authstatus
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboarRoute);
  }

  Future<bool> isAuth() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // todo IR AL BACKEND Y COMPROBAR EL JWT ES VALIDO
    await Future.delayed(const Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
