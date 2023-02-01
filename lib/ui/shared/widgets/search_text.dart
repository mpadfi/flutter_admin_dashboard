import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      // decoration: buildBoxDecoration(),
      child: TextField(
        enableInteractiveSelection: false,
        style: GoogleFonts.poppins(color: Colors.black),
        decoration: CustomInput.searchInputDecoration(
          hint: 'Buscar',
          icon: Icons.search_outlined,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      );
}
