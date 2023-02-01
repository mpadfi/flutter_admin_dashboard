import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/api/cafe_api.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  //
  List<Categoria> categorias = [];
  bool ascending = true;

  getCategories() async {
    final resp = await CafeApi.get('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);
    categorias = [...categoriesResp.categorias];
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};
    try {
      //
      final json = await CafeApi.post('/categorias', data);
      final newCategoria = Categoria.fromMap(json);

      categorias.add(newCategoria);

      notifyListeners();
      //
    } catch (e) {
      print('error al crear categoría');
    }
  }

  Future updateCategory(String id, String name, bool? estado) async {
    final data = {'nombre': name, 'estado': estado};
    try {
      //
      await CafeApi.put('/categorias/$id', data);

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

  Future deleteCategory(String id) async {
    //
    try {
      //
      await CafeApi.httpDelete('/categorias/$id', {});

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
      //
    } catch (e) {
      print(e);
      print('error al crear categoría');
    }
  }

  void sort<T>(Comparable<T> Function(Categoria category) getField) {
    categorias.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }
}
