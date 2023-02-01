import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/ui/api/cafe_api.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  //
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuth();
  }

  login(String email, String password) {
    //
    final credentials = {'correo': email, 'password': password};

    CafeApi.post('/auth/login', credentials).then((json) {
      //
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      // Navegar al dashboard porque cambia el authstatus
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboarRoute);

      // configuramos Dio para que se use el token en todas las peticiones
      CafeApi.configureDio;
      notifyListeners();
      //
    }).catchError((e) {
      NotificationsService.showSnackbarError('Login Incorrecto');
    });
  }

  register(String email, String password, String name) {
    // body de la petición POST de registro
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.post('/usuarios', data).then((json) {
      //
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      // Navegar al dashboard porque cambia el authstatus
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboarRoute);
      // configuramos Dio para que se use el token en todas las peticiones
      CafeApi.configureDio;
      notifyListeners();
      //
    }).catchError((e) {
      NotificationsService.showSnackbarError('Registro Incorrecto');
    });
  }

  Future<bool> isAuth() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // IR AL BACKEND Y COMPROBAR EL JWT ES VALIDO
    try {
      final resp = await CafeApi.get('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.replaceTo(Flurorouter.loginRoute);
    notifyListeners();
  }
}
