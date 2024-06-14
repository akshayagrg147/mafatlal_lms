// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/utils/contants.dart';

class TextView extends StatelessWidget {
  String text;
  String? fontFamily;
  double? fontsize;
  FontWeight? fontweight;
  Color? textColor;
  TextAlign textAlign;
  int? maxLine;
  TextOverflow? overflow;
  double? latterSpacing;
  double? fontHeight;
  TextDecoration? decoration;
  bool useRoboto = false;

  TextView(
      this.text, {
        Key? key,
        this.fontFamily = Constants.fontFamily,
        this.fontsize = 14,
        this.fontweight,
        this.maxLine,
        this.overflow,
        this.fontHeight,
        this.latterSpacing,
        this.decoration,
        this.useRoboto = false,
        this.textAlign = TextAlign.start,
        this.textColor = ThemeColor.black,
      }) : super(key: key) {
    if (useRoboto) {
      fontFamily = GoogleFonts.roboto().fontFamily;
    } else {
      fontFamily = GoogleFonts.poppins().fontFamily;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
          color: textColor,
          fontFamily: fontFamily,
          fontSize: fontsize,
          overflow: overflow,
          fontWeight: fontweight,
          decoration: decoration,
          height: fontHeight,
          letterSpacing: latterSpacing),
    );
  }
}
