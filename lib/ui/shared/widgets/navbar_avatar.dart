import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://www.polycashback.com/img-bucket/21_63248d1a2c69d.png";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        imageUrl,
        (int _) => ImageElement()
          ..src = imageUrl
          ..style.width = '100%'
          ..style.height = '100%');
    return ClipOval(
      child: SizedBox(
        width: 40,
        height: 40,
        child: HtmlElementView(
          viewType: imageUrl,
        ),
      ),
    );
  }
}
