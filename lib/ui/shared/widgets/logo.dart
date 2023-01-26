import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 30.0),
        child: Image.asset(
          'assets/poly-white.png',
          height: 50.0,
        )
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Icon(Icons.dashboard, color: Colors.white),
        //     const SizedBox(width: 10.0),
        //     Text(
        //       'Dash',
        //       style: GoogleFonts.poppins(
        //         fontSize: 30.0,
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
