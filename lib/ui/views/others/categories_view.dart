import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  //
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    final categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    //
    final categoriesProvider = Provider.of<CategoriesProvider>(context);

    return Container(
      padding: const EdgeInsets.all(30.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          // Text('Categorias', style: CustomLabels.h2),
          // const SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID', style: CustomLabels.tableFirstRow)),
              DataColumn(
                label: Text('Categoría', style: CustomLabels.tableFirstRow),
                onSort: (colIndex, _) {
                  categoriesProvider.sort<String>((category) => category.nombre);
                },
              ),
              DataColumn(label: Text('Creador', style: CustomLabels.tableFirstRow)),
              DataColumn(label: Text('Acciones', style: CustomLabels.tableFirstRow)),
            ],
            source: CategoriesDTS(categoriesProvider.categorias, context),
            sortColumnIndex: 2,
            sortAscending: true,
            header: Text('Categorías', maxLines: 2, style: CustomLabels.tableHeader),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {
                  showModalBottomSheet(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => const CategoryModal(
                      categoria: null,
                    ),
                  );
                },
                text: 'Crear',
                icon: Icons.add_to_photos_rounded,
              )
            ],
          ),
        ],
      ),
    );
  }
}
