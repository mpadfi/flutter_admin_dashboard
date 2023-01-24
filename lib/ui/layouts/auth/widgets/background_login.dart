import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            // todo poner imagen
            // child: Image(
            //   image: AssetImage('poly-white.png'),
            //   width: 250,
            // ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('city.jpg'),
          fit: BoxFit.cover,
        ),
      );
}
