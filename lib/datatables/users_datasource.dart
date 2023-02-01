import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  //
  final List<Usuario> users;

  UsersDTS(this.users);

  @override
  DataRow? getRow(int index) {
    //
    final usuario = users[index];
    final image = Image.asset('no-image.jpg', width: 35, height: 35);

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          ClipOval(
            child: usuario.img != null ? Image.network(usuario.img!) : image,
          ),
        ),
        DataCell(Text(usuario.nombre, style: CustomLabels.tableUser)),
        DataCell(Text(usuario.correo, style: CustomLabels.tableText)),
        DataCell(Text(usuario.uid, style: CustomLabels.tableText)),
        DataCell(
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              NavigationService.replaceTo('/dashboard/users/${usuario.uid}');
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
