import 'dart:typed_data';

import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/api/cafe_api.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  //
  Usuario? user;
  late GlobalKey<FormState> formUpdateKey;

  // Si queremos llamar al metodo notifyListener desde el onChange de los inputs
  // void updateListener() {
  //   notifyListeners();
  // }

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }

  bool _validForm() {
    if (formUpdateKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future updateUser() async {
    if (!_validForm()) return;
    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };
    try {
      final resp = await CafeApi.put('/usuarios/${user!.uid}', data);
      return true;
    } catch (e) {
      print('error en UPDATEUSER');
      return false;
    }
  }

  Future<Usuario> updateImage(String path, Uint8List bytes) async {
    try {
      final resp = await CafeApi.uploadFile(path, bytes);
      user = Usuario.fromMap(resp);
      notifyListeners();
      return user!;
    } catch (e) {
      print('eeror en updateImage');
      throw 'Error en user provider';
    }
  }
}
