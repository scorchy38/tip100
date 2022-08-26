import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tip100/languages/language_ta.dart';

import 'language_en.dart';
import 'language_hi.dart';
import 'languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ta'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();

      case 'ta':
        return LanguageTa();
      default:
        return LanguageTa();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}