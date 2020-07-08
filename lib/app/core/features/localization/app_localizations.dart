import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_localization_delegate.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  Map<String, dynamic> _localizationsStrings;

  Future<bool> load() async {
    var jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizationsStrings = jsonMap.map((key, value) {
      return MapEntry(key, value);
    });

    return true;
  }

  String translate(String key,
      {Map<String, String> params, String defaultValue = ''}) {
    var value;

    if (key.contains('.')) {
      key.split('.').forEach((element) {
        if (value == null) {
          value = _localizationsStrings[element];
        } else {
          value = value[element];
        }
      });
    }

    // tratamento para caso não venha nada
    if (value == null) {
      return throw ArgumentError(
        'key: $key not found in ${locale.toLanguageTag}.json',
      );
    }

    // parametros para poder concatenar valores com o texto
    if (params != null) {
      params.forEach((key, value) {
        value = value.replaceAll('{{$key}}', value);
      });
    }

    // caso valor esteja nulo retorna o valor default
    return value ?? defaultValue;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();
}
