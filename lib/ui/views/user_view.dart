import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';

import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class UserView extends StatefulWidget {
  //
  final String uid;

  const UserView({
    super.key,
    required this.uid,
  });

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  //
  Usuario? user;

  @override
  void initState() {
    super.initState();
    // cargamos el usuario con el usersProvider y lo asignamos al formulario para rellenar los inputs
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null) {
        userFormProvider.user = userDB;
        //? inicializamos el globalKey del formulario de actualizacion
        userFormProvider.formUpdateKey = GlobalKey<FormState>();
        setState(() {
          user = userDB;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });
  }

  // @override
  // void dispose() {
  //   user = null;
  //   Provider.of<UserFormProvider>(context, listen: false).user = null;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('User View', style: CustomLabels.h1),
          const SizedBox(height: 10),
          (user == null)
              ? WhiteCard(
                  childWidget: Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : const _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {0: FixedColumnWidth(300), 1: FixedColumnWidth(500)},
        children: [
          TableRow(
            children: [
              //* Avatar
              _AvatarContainer(),
              //todo Formulario
              const _UserForm(),
              Container(),
            ],
          )
        ],
      ),
    );
  }
}

class _UserForm extends StatelessWidget {
  const _UserForm();

  @override
  Widget build(BuildContext context) {
    //
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información general',
      //* FORMULARIO ACTUALIZACIÓN USUARIO
      childWidget: Form(
        key: userFormProvider.formUpdateKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //* NOMBRE INPUT

              TextFormField(
                decoration: CustomInput.formInputDecoration(
                  hint: 'Nombre de usuario',
                  label: 'Nombre',
                  icon: Icons.supervised_user_circle_outlined,
                ),
                initialValue: user.nombre,
                onChanged: (value) {
                  userFormProvider.copyUserWith(nombre: value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El campo nombre no puede estar vacio';
                  }
                  if (value.length < 3) {
                    return 'Al menos 3 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              //* EMAIL INPUT

              TextFormField(
                decoration: CustomInput.formInputDecoration(
                  hint: 'Email de usuario',
                  label: 'Email',
                  icon: Icons.mark_email_read_outlined,
                ),
                initialValue: user.correo,
                onChanged: (value) {
                  userFormProvider.copyUserWith(correo: value);
                },
                validator: (value) {
                  if (!EmailValidator.validate(value ?? '')) {
                    return 'Email no válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              //* BOTÓN GUARDAR

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff624ef2),
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    final saveUser = await userFormProvider.updateUser();
                    if (saveUser) {
                      NotificationsService.showSnackbar('Usuario Actualizado');
                      if (context.mounted) {
                        Provider.of<UsersProvider>(context, listen: false).refreshUser(user);
                      }
                      NavigationService.navigateTo('dashboard/users');
                    } else {
                      NotificationsService.showSnackbarError('Actualización fallida');
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.save_outlined),
                      SizedBox(width: 5),
                      Text('Guardar'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      cardWidth: 250,
      childWidget: Container(
        height: 240,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h3),
            const SizedBox(height: 20),
            SizedBox(
              width: 130,
              height: 140,
              child: Stack(
                children: [
                  ClipOval(child: Image.asset('no-image.jpg')),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xff624ef2),
                        onPressed: () {},
                        child: const Icon(Icons.camera_alt_outlined, size: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(user.nombre, style: CustomLabels.h4),
            if (user.correo != '')
              FittedBox(
                fit: BoxFit.contain,
                child: Text(user.correo, style: CustomLabels.p),
              )
          ],
        ),
      ),
    );
  }
}
