import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:playground/src/core/string_constant.dart';
import 'package:playground/src/features/data/api/movie_api.dart';
import 'package:playground/src/features/data/dto/api_error.dart';

import '../../../core/helper/resource_helper.dart';
import '../../domain/models/url_path.dart';
import '../dto/movie_response_list.dart';

//TODO use interceptor
class MovieApiImpl extends MovieApi {
  final http.Client client;

  MovieApiImpl(this.client);

  @override
  Future<MovieResponseList> getMovieList(String urlPath, int page) async {
    Map<String, dynamic> response;
    if (StringConstant.apiKey.isNotEmpty) {
      final result = await client.get(Uri.parse('${UrlPath.baseUrl}/$urlPath'));
      response = jsonDecode(result.body);
    } else {
      response = await JsonHelper.getJson('movie_list.json');
    }
    try {
      MovieResponseList data = MovieResponseList.fromJson(response);
      log("check data ${data.totalPages}");
      // MovieResponseList data = MovieResponseList.fromJson(jsonDecode(response.body));
      return data;
    } catch (e) {
      log("error $e");
      throw ParsingException("Something went wrong");
    }
  }
}
