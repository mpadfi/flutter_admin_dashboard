import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  //
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base URL
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configurar Headers
    _dio.options.headers = {'x-token': LocalStorage.prefs.getString('token') ?? ''};
  }

  static Future httpGet(String path) async {
    try {
      //
      final resp = await _dio.get(path);
      return resp.data;
      //
    } catch (e) {
      print(e);
      throw ('Error en el GET');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    // convertimos la data para la petición http (body)
    final formData = FormData.fromMap(data);

    try {
      //
      final resp = await _dio.post(path, data: formData);
      return resp.data;
      //
    } catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    // convertimos la data para la petición http (body)
    final formData = FormData.fromMap(data);

    try {
      //
      final resp = await _dio.put(path, data: formData);
      return resp.data;
      //
    } catch (e) {
      print(e);
      throw ('Error en el PUT');
    }
  }
}
