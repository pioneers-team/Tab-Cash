import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PoppinsText extends StatelessWidget {
   PoppinsText({Key? key,
    required this.text,
    this.fontSize ,
    this.letterSpacing,
    this.color = Colors.black,
    this.fontWeight

  }) : super(key: key);
 final String text;
 double? fontSize;
 double? letterSpacing;
 final Color color;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return  Text(text,
      style: GoogleFonts.poppins(
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          color:color,
          fontWeight: fontWeight),
    );
  }
}
