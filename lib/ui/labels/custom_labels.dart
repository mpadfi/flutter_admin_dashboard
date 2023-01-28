import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabels {
  //
  static Color purple = const Color(0xff624ef2);

  static TextStyle h1 = GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w900);
  static TextStyle h2 = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w800);
  static TextStyle h3 = GoogleFonts.poppins(fontSize: 18, height: 1, fontWeight: FontWeight.w700);
  static TextStyle h4 = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle p = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle tableHeader = GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle tableFirstRow = GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700);

  static TextStyle total = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle price = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400, color: purple);
  static TextStyle date = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: purple);
  static TextStyle confirmed = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.green);
  static TextStyle pending = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle priceSmall = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: purple);
  static TextStyle storedesc = GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400);
  static TextStyle cashback = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: purple);
}
