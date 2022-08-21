import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_defaults.dart';

class AppThemes {
  static const _fontName = 'ProductSans';

  static ThemeData get light => ThemeData(

        fontFamily: _fontName,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        textTheme: ThemeData.light().textTheme.apply(fontFamily: _fontName),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            )),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.3,
            ),
          ),
          hintStyle: TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.3,
              color: Colors.grey,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              onPrimary: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: AppDefaults.borderRadius,
              ),
              padding: const EdgeInsets.all(AppDefaults.padding),
              textStyle: ThemeData.light().textTheme.button?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: _fontName,
                  )),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: Colors.black,
              elevation: 0,
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: AppDefaults.borderRadius,
              ),
              padding: const EdgeInsets.all(AppDefaults.padding),
              textStyle: ThemeData.light().textTheme.button?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: _fontName,
                  )),
        ),
      );
}
