import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardLayout extends StatelessWidget {
  //
  final Widget child;

  const DashBoardLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Dashboard', style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w900)),
            Expanded(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
