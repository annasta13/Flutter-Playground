import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground/src/features/data/dto/movie_detail/movie_detail_response.dart';
import 'package:playground/src/features/data/dto/movie_detail/review_response.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Movie Detail JSON Parsing', ()
  {
    test('should parse the JSON correctly into MovieDetail', ()
    async {
      final String jsonString =
          await rootBundle.loadString('assets/movie_detail_278.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      final data = MovieDetailResponse.fromJson(jsonData);
      expect(data, isNotNull);
      expect(data.originalTitle, isNotEmpty);
      expect(data.overview, isNotEmpty);
    });

    test('should parse the JSON correctly into Review', ()
    async {
      final String jsonString =
      await rootBundle.loadString('assets/movie_review_278.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      final data = ReviewResponse.fromJson(jsonData);
      expect(data, isNotNull);
      expect(data.items, isNotEmpty);
    });
  });
}
