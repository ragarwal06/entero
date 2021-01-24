import 'package:entero/util/constant/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'i18n/AppLocalizations.dart';

void main() {
  runApp(Entero());
}

class Entero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryAppColor,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),

      // Multiple Languages Support
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('es', "ES"),
      ],

      localizationsDelegates: [
        // AppLocalizations.of(context).translate('my key';)
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      //Callback if not found
      localeResolutionCallback: (locale, supportedLocales) {
        // Walk through the supported locale
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.countryCode == locale.countryCode &&
              supportedLocale.languageCode == locale.languageCode) {
            //return if locale found
            return supportedLocale;
          }
        }
        // fallback if locale not found
        return supportedLocales.first;
      },

      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Hello World"),
      ),
    );
  }
}
