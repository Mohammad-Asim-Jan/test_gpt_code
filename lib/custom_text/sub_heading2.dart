import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeading2 extends StatelessWidget {
  final String title;
  const SubHeading2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: GoogleFonts.ibmPlexSansDevanagari(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
