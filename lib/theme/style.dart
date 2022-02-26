import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/style_guide/colors.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      primaryColor: primaryColor,
      disabledColor: disabledColor,
      backgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleSpacing: 10,
        iconTheme: IconThemeData(color: highEmphasisColor),
        backgroundColor: Colors.white,
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.roboto(
          fontSize: ScreenUtil().setSp(96 * WidgetsConstant.pixelDensity),
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5 * WidgetsConstant.width,
        ),
        headline2: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(60 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5 * WidgetsConstant.width),
        headline3: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(48 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400),
        headline4: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(34 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25 * WidgetsConstant.width),
        headline5: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(24 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400),
        headline6: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(20 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15 * WidgetsConstant.width),
        subtitle1: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(16 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15 * WidgetsConstant.width),
        subtitle2: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(14 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1 * WidgetsConstant.width),
        bodyText1: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(16 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5 * WidgetsConstant.width),
        bodyText2: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(14 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25 * WidgetsConstant.width,
            height: 1.6 * WidgetsConstant.height),
        button: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(14 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25 * WidgetsConstant.width),
        caption: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(12 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4 * WidgetsConstant.width),
        overline: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(10 * WidgetsConstant.pixelDensity),
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5 * WidgetsConstant.width),
      ));
}
