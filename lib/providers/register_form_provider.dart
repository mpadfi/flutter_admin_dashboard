import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('FORM VALID');
      print('Name: $name, Email: $email, Password: $password');
    } else {
      print('form invalid!!!');
    }
  }
}
