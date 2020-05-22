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

final TextStyle myFilterChipStyle = GoogleFonts.playfairDisplay(
  color: Colors.grey,
  fontSize: 20,
);

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
