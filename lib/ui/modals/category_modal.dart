import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  //
  final Categoria? categoria;

  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  //
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    //
    final categoryProvider = Provider.of<CategoriesProvider>(context, listen: false);

    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(20),
        height: 500,
        width: 700,
        decoration: buildBoxDecoration(),
        child: Column(children: [
          //* TÍTULO MODAL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria != null ? 'Editar Categoría' : 'Nueva Categoría',
                // widget.categoria?.nombre ?? 'Nueva Categoría',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 20),

          //* INPUT NOMBRE CATEGORÍA
          TextFormField(
            autofocus: true,
            initialValue: widget.categoria?.nombre,
            onChanged: (value) => nombre = value,
            decoration: CustomInput.authInputDecoration(
              hint: 'Nombre categoría',
              label: 'Categoría',
              icon: Icons.new_label_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: CustomOutlinedButton(
              onPressed: () async {
                if (id == null) {
                  // Crear
                  await categoryProvider.newCategory(nombre);
                } else {
                  // Actualizar
                  await categoryProvider.updateCategory(id!, nombre);
                }
                // Cerramos el modal
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.grey[900],
        // boxShadow: const [
        //   BoxShadow(
        //     blurRadius: 14,
        //     color: Colors.black26,
        //   )
        // ],
      );
}
