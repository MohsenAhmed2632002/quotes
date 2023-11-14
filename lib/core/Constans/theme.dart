import 'package:flutter/material.dart';
import 'package:quotes/core/Constans/Colors.dart';
import 'package:quotes/core/Constans/Font.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // brightness: Brightness.light,
    fontFamily: FontConstants.fontFamily,
    //////////////////
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    useMaterial3: true,
    ////////////////
    cardTheme: CardTheme(
      color: ColorManager.darkPrimary,
      shadowColor: ColorManager.darkGrey,
      elevation: Fontsize.s12,
    ),
/////////////////
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      elevation: Fontsize.s12,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      shadowColor: ColorManager.darkPrimary,
      titleTextStyle: getBoldTextStyle(
        color: Colors.black,
      ),
    ),
    ////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegulerTextStyle(
          color: Colors.white,
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
    ),
    ////////////////////
    textTheme: TextTheme(
        subtitle1: getMediumTextStyle(
          color: ColorManager.darkGrey,
        ),
        headline1: getBoldTextStyle(
          color: ColorManager.darkGrey,
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(
        12,
      ),
      hintStyle: getRegulerTextStyle(
        color: ColorManager.darkGrey,
      ),
      labelStyle: getRegulerTextStyle(
        color: ColorManager.grey,
      ),
      errorStyle: getMediumTextStyle(
        color: Colors.red,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.lightGrey),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.darkPrimary),
        borderRadius: BorderRadius.circular(
          0,
        ),
      ),
    ),
  );
}
