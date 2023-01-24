import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/register_form_provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) => buildContainerForm(context),
      ),
    );
  }

  Container buildContainerForm(BuildContext context) {
    //
    final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      // color: const Color(0xff624ef2),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370.0),

          //* FORMULARIO
          child: Form(
            key: registerFormProvider.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                //* NOMBRE
                TextFormField(
                  validator: (value) {
                    if (value == '' || value!.isEmpty) return 'Nombre requerido';
                    return null;
                  },
                  onChanged: (value) => registerFormProvider.name = value,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_sharp,
                  ),
                ),
                const SizedBox(height: 20.0),

                //* EMAIL
                TextFormField(
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? '')) return 'Email no válido';
                    return null;
                  },
                  onChanged: (value) => registerFormProvider.email = value,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                ),
                const SizedBox(height: 20.0),

                //* PASSWORD
                TextFormField(
                  validator: (value) {
                    if (value == null) return 'Ingrese su contraseña';
                    if (value.length < 6) return 'Al menos 6 caracteres';
                    return null;
                  },
                  onChanged: (value) => registerFormProvider.password = value,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authInputDecoration(
                    hint: 'Ingrese su password',
                    label: 'Password',
                    icon: Icons.lock_outline,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomOutlinedButton(
                  onPressed: () {
                    registerFormProvider.validateForm();
                  },
                  text: 'Crear cuenta',
                  isFilled: true,
                ),
                const SizedBox(height: 20.0),
                LinkText(
                  text: 'Iniciar sesión',
                  onClick: () {
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
