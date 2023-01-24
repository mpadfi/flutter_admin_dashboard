import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // late: cuando se vaya a utilizar tendra un valor (no inicializado)
  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
