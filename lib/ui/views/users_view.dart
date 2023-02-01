import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';

import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final usersProvider = Provider.of<UsersProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          // Text('Users View', style: CustomLabels.h1),
          // const SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Avatar', style: CustomLabels.tableFirstRow)),
              DataColumn(
                  label: Text('Nombre', style: CustomLabels.tableFirstRow),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.nombre);
                  }),
              DataColumn(
                  label: Text('Email', style: CustomLabels.tableFirstRow),
                  onSort: (colIndex, _) {
                    usersProvider.sortColumnIndex = colIndex;
                    usersProvider.sort<String>((user) => user.correo);
                  }),
              DataColumn(label: Text('UID', style: CustomLabels.tableFirstRow)),
              DataColumn(label: Text('Acciones', style: CustomLabels.tableFirstRow)),
            ],
            source: UsersDTS(usersProvider.users),
            header: Text('Usuarios', maxLines: 2, style: CustomLabels.tableHeader),
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
          ),
        ],
      ),
    );
  }
}
