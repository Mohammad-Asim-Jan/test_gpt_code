import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.pacifico(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.yellow.shade50,
      ),
    );
  }
}
