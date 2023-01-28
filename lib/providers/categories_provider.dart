import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/api/cafe_api.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  //
  List<Categoria> categorias = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);
    categorias = [...categoriesResp.categorias];
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};
    try {
      //
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategoria = Categoria.fromMap(json);

      categorias.add(newCategoria);

      notifyListeners();
      //
    } catch (e) {
      print(e);
      print('error al crear categoría');
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};
    try {
      //
      await CafeApi.httpPut('/categorias/$id', data);

      categorias = categorias.map((categoria) {
        if (categoria.id != id) return categoria;
        categoria.nombre = name;
        return categoria;
      }).toList();

      notifyListeners();
      //
    } catch (e) {
      print(e);
      print('error al crear categoría');
    }
  }
}
