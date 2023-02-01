import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/api/cafe_api.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  //
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  // Constructor para cargar usuario al instanciar el provider
  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final resp = await CafeApi.get('/usuarios?limite=100&desde=0');
    final userResp = UsersResponse.fromMap(resp);
    users = [...userResp.usuarios];
    isLoading = false;
    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final resp = await CafeApi.get('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      return user;
    } catch (e) {
      // si el usuario no existe retornamos null
      return null;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }

  void refreshUser(Usuario newUser) {
    users = users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user; // mantenemos igual los que no son el newUser
    }).toList();
    notifyListeners();
  }
}
