import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

class KeyAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    log('easy localization loader: load http $path');
    log(locale.toLanguageTag());

    try {
      var url = Uri.parse(path);
      final Map<String, dynamic> result = await http
          .get(url)
          .then((response) => json.decode(response.body.toString()));
      print(result);
      return result[locale.toLanguageTag()];
    } catch (e) {
      //Catch network exceptions
      return Future.value();
    }
  }
}
