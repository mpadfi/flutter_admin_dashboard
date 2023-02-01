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

  static Future get(String path) async {
    try {
      //
      final resp = await _dio.get(path);
      return resp.data;
      //
    } on DioError catch (e) {
      print(e);
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    // convertimos la data para la petición http (body)
    final formData = FormData.fromMap(data);

    try {
      //
      final resp = await _dio.post(path, data: formData);
      return resp.data;
      //
    } on DioError catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    // convertimos la data para la petición http (body)
    final formData = FormData.fromMap(data);

    try {
      //
      final resp = await _dio.put(path, data: formData);
      return resp.data;
      //
    } on DioError catch (e) {
      print(e);
      throw ('Error en el PUT');
    }
  }

  static Future httpDelete(String path, Map<String, dynamic> data) async {
    // convertimos la data para la petición http (body)
    final formData = FormData.fromMap(data);

    try {
      //
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
      //
    } on DioError catch (e) {
      print(e);
      throw ('Error en el DELETE');
    }
  }
}
