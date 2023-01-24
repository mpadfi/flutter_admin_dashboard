import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput {
  static InputDecoration authInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) =>
      InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff624ef2)),
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(20),
        hintText: hint,
        labelText: label,
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        labelStyle: GoogleFonts.poppins(color: Colors.grey),
        floatingLabelStyle: GoogleFonts.poppins(color: Colors.pink),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Icon(icon, color: Colors.white),
        ),
      );
}
