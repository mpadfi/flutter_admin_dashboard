import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: ClipOval(
        child: Image.network('https://www.polycashback.com/img-bucket/21_63248d1a2c69d.png'),
      ),
    );
  }
}
