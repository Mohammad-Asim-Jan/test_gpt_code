import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeading1 extends StatelessWidget {
  final String title;
  const SubHeading1({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.inder(
        fontSize: 45,
        fontWeight: FontWeight.w900,
        color: Colors.orange.shade100,
      ),
    );
  }
}
