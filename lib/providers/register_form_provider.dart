import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  //
  // Provider para obtener los valores del formulario de registro y validarlo en función de su validator
  //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('FORM VALID');
      print('Name: $name, Email: $email, Password: $password');
      return true;
    } else {
      print('form invalid!!!');
      return false;
    }
  }
}
