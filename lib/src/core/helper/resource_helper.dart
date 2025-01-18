import 'dart:convert';

import 'package:flutter/services.dart';

class JsonHelper {
  static Future<T> loadJson<T>(
    String filePath,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final String jsonString = await rootBundle.loadString(filePath);
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return fromJson(jsonData);
  }

  static Future<Map<String, dynamic>> getJson(String fileName) async{
    final String jsonString =
        await rootBundle.loadString('assets/$fileName');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }
}
