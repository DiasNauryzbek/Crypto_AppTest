import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class boldText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const boldText(this.text, this.fontSize,this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w400),
    );
  }
}
