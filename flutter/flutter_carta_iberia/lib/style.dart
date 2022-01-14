import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DamStyle {
  // Colors
  static const Color primaryColor = Color(0xffffffff);
  static const Color secondaryColor = Color(0xFFEE8B60);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color orangeColor = Color(0xFFE62F16);
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color greyColor = Color.fromRGBO(240, 240, 240, 1);

  // Margins, Paddings, Card properties
  static const double bodyPadding = 10.0;

  // Font sizes, TextStyles
  static const double textSizeSmall = 15.0;
  static const double textSizeMedium = 20.0;
  static const double textSizeBig = 30.0;
  static const double textSizeTitle = 40.0;

  static TextStyle get textTitle => GoogleFonts.getFont(
        'Nunito',
        color: DamStyle.orangeColor,
        fontWeight: FontWeight.w600,
        fontSize: 40,
      );

  static TextStyle textTitleCustom(Color c, double fSize) =>
      GoogleFonts.getFont(
        'Nunito',
        color: c,
        fontWeight: FontWeight.w700,
        fontSize: fSize,
      );
}