import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput {
  //
  static InputDecoration authInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    final radius = BorderRadius.circular(20);
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        borderRadius: radius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xff624ef2)),
        borderRadius: radius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: radius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: radius,
      ),
      contentPadding: const EdgeInsets.all(20),
      hintText: hint,
      labelText: label,
      hintStyle: GoogleFonts.poppins(color: Colors.grey),
      labelStyle: GoogleFonts.poppins(color: Colors.grey),
      floatingLabelStyle: GoogleFonts.poppins(color: Colors.white),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
