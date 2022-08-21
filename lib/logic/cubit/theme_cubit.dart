// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
//
// part 'theme_state.dart';
//
// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)) {
//     updateAppTheme();
//   }
//
//   void updateAppTheme() async {
//     final Brightness currentBrightness = AppTheme.currentSystemBrightness;
//
//     currentBrightness == Brightness.light
//         ? _setTheme(ThemeMode.light)
//         : _setTheme(ThemeMode.light);
//   }
//
//   void _setTheme(ThemeMode themeMode) {
//     AppTheme.setStatusBarAndNavigationBarColors(themeMode);
//     emit(ThemeState(themeMode: themeMode));
//   }
// }
