import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Center(
          child: Text(
            '404 - Página no encontarda',
            style: GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
