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

ThemeData appTheme = ThemeData(
  primaryColor: Colors.amberAccent,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
