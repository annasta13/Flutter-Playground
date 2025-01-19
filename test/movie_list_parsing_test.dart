import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground/src/features/data/dto/movie_list/movie_response_list.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Movie List JSON Parsing', ()
  {
    test('should parse the JSON correctly into MovieList', ()
    async {
      final String jsonString =
          await rootBundle.loadString('assets/movie_list.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      final movieList = MovieResponseList.fromJson(jsonData);
      expect(movieList.page, isNotNull);
      expect(movieList.totalPages, isNotNull);
      expect(movieList.movieList?.length, greaterThan(0));
    });
  });
}
