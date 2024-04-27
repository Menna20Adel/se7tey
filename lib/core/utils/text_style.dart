import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se7tey/core/utils/colors.dart';

TextStyle getTitleStyle(
        {Color? color,
        double? fontSize = 18,
        FontWeight? fontWeight = FontWeight.bold}) =>
    TextStyle(
      fontSize: fontSize,
      color: color ?? AppColors.blue,
      fontWeight: fontWeight,
      fontFamily: GoogleFonts.cairo().fontFamily,
    );

TextStyle getbodyStyle(
        {Color? color,
        double? fontSize = 16,
        FontWeight? fontWeight = FontWeight.w400}) =>
    TextStyle(
        fontSize: fontSize,
        color: color ?? AppColors.black,
        fontWeight: fontWeight,
        fontFamily: GoogleFonts.cairo().fontFamily);

TextStyle getsmallStyle(
        {Color? color,
        double? fontSize = 14,
        FontWeight? fontWeight = FontWeight.w500}) =>
    TextStyle(
        fontSize: fontSize,
        color: color ?? AppColors.black,
        fontWeight: fontWeight,
        fontFamily: GoogleFonts.cairo().fontFamily);
