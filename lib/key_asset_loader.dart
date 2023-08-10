import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KeyAssetLoader extends AssetLoader {
  final ValueNotifier<bool> loadingTranslations;

  KeyAssetLoader(this.loadingTranslations);
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    loadingTranslations.value = true;
    try {
      var url = Uri.parse('$path/${locale.toLanguageTag()}');
      final Map<String, dynamic> result = await http
          .get(url)
          .then((response) => json.decode(response.body.toString()));
      loadingTranslations.value = false;
      return result;
    } catch (e) {
      loadingTranslations.value = false;
      //Catch network exceptions
      return Future.value();
    }
  }
}
