import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

import '../inputs/custom_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) => buildContainerForm(context)),
    );
  }

  Container buildContainerForm(BuildContext context) {
    //
    final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 80.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      // color: const Color(0xff624ef2),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370.0),

          //* FORMULARIO LOGIN
          child: Form(
            key: loginFormProvider.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                //* EMAIL
                TextFormField(
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? '')) {
                      return 'Email no valido';
                    }
                    return null;
                  },
                  onChanged: (value) => loginFormProvider.email = value,
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
                  onChanged: (value) => loginFormProvider.password = value,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authInputDecoration(
                    hint: 'Ingrese su password',
                    label: 'Password',
                    icon: Icons.lock_outline,
                  ),
                ),
                const SizedBox(height: 20.0),

                //* SUBMINT DEL FORMULARIO
                CustomOutlinedButton(
                  onPressed: () {
                    final isValid = loginFormProvider.validateForm();
                    if (isValid) {
                      authProvider.login(loginFormProvider.email, loginFormProvider.password);
                    }
                  },
                  text: 'Ingresar',
                  isFilled: true,
                ),
                const SizedBox(height: 20.0),
                LinkText(
                  text: 'Crear cuenta',
                  onClick: () {
                    Navigator.pushNamed(context, Flurorouter.registerRoute);
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
