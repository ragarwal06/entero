import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext buildContext) {
    return Localizations.of<AppLocalizations>(buildContext, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  Map<String, String> _localizedString;

  Future<bool> load() async {
    String jsonString =
    await rootBundle.loadString('lib/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonDecode = json.decode(jsonString);

    _localizedString =
        jsonDecode.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key) {
    return _localizedString[key];
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}