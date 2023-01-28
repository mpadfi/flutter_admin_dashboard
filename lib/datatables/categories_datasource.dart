import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  //
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow? getRow(int index) {
    final categoria = categorias[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(categoria.id, style: CustomLabels.p)),
        DataCell(Text(categoria.nombre, style: CustomLabels.p)),
        DataCell(Text(categoria.usuario.nombre, style: CustomLabels.p)),
        DataCell(Row(
          children: [
            //
            //* BOTÓN BORRAR CATEGORÍA
            IconButton(
                icon: const Icon(Icons.edit_rounded),
                onPressed: () {
                  showModalBottomSheet(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                      categoria: categoria,
                    ),
                  );
                }),

            //* BOTÓN BORRAR CATEGORÍA

            IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                onPressed: () {
                  final dialog = AlertDialog(
                    // backgroundColor: Colors.white,
                    // surfaceTintColor: Colors.white,
                    shadowColor: Colors.black38,
                    elevation: 20,
                    title: Text('¿Estás seguro?', style: CustomLabels.h3),
                    content: Text('Eliminarás la categoría ${categoria.nombre}', style: CustomLabels.p),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancelar', style: CustomLabels.p),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Eliminar', style: CustomLabels.p),
                      ),
                    ],
                  );
                  showDialog(
                    barrierColor: Colors.white70,
                    context: context,
                    builder: (_) => dialog,
                  );
                }),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
