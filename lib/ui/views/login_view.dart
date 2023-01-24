import 'package:flutter/material.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

import '../inputs/custom_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      // color: const Color(0xff624ef2),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370.0),
          child: Form(
            child: Column(
              children: [
                // EMAIL
                TextFormField(
                  // validator: (),
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInput.authInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                ),
                const SizedBox(height: 20.0),
                // PASSWORD
                TextFormField(
                  // validator: (),
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
                  onPressed: () {},
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
