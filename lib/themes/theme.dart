import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle appheadingNotes = GoogleFonts.montserrat(
  fontWeight: FontWeight.bold,
  fontSize: 32,
);

final TextStyle appSubheadingNotes = GoogleFonts.montserrat(
  color: Colors.grey,
  fontSize: 16,
);

final TextStyle myChoiceChipStyleOff = GoogleFonts.montserrat(
  color: Colors.grey,
  fontSize: 18,
);

final TextStyle myChoiceChipStyleOn = GoogleFonts.montserrat(
  color: Colors.black,
  fontSize: 19,
  fontWeight: FontWeight.w500,
  wordSpacing: 0.2,
);

final TextStyle myChipUnderline = TextStyle(
  color: Colors.yellowAccent[700],
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final TextStyle notestitle = GoogleFonts.montserrat(
  color: Colors.black,
  fontSize: 19,
  fontWeight: FontWeight.w500,
  wordSpacing: 0.2,
);

final TextStyle notescontent = GoogleFonts.openSans(
  fontSize: 16,
);

final TextStyle dateStringStyle = GoogleFonts.openSans(
  fontWeight: FontWeight.w400,
  wordSpacing: 0.5,
  color: Colors.black87,
);

ThemeData appTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
