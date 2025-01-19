import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:playground/src/core/string_constant.dart';
import 'package:playground/src/features/data/api/movie_api.dart';
import 'package:playground/src/features/data/dto/api_error.dart';
import 'package:playground/src/features/data/dto/movie_detail/movie_detail_response.dart';

import '../../../core/helper/resource_helper.dart';
import '../../domain/models/url_path.dart';
import '../dto/movie_detail/review_response.dart';
import '../dto/movie_list/movie_response_list.dart';

class MovieApiImpl extends MovieApi {
  final http.Client client;

  MovieApiImpl(this.client);

  @override
  Future<MovieResponseList> fetchMovieList(String urlPath, int page) async {
    Map<String, dynamic> response;
    if (StringConstant.apiKey.isNotEmpty) {
      final result = await client.get(Uri.parse('${UrlPath.baseUrl}movie/$urlPath'));
      response = jsonDecode(result.body);
    } else {
      response = await JsonHelper.getJson('movie_list.json');
    }
    try {
      MovieResponseList data = MovieResponseList.fromJson(response);
      return data;
    } catch (e) {
      throw ParsingException("Something went wrong");
    }
  }

  @override
  Future<MovieDetailResponse> fetchMovieDetail(int movieId) async {
    Map<String, dynamic> response;
    if (StringConstant.apiKey.isNotEmpty) {
      final result =
          await client.get(Uri.parse('${UrlPath.baseUrl}movie/$movieId'));
      response = jsonDecode(result.body);
    } else {
      response = await JsonHelper.getJson('movie_detail_$movieId.json');
    }
    try {
      MovieDetailResponse data = MovieDetailResponse.fromJson(response);
      return data;
    } catch (e) {
      throw ParsingException("Something went wrong");
    }
  }

  @override
  Future<ReviewResponse> fetchMovieReview(int movieId) async {
    Map<String, dynamic> response;
    if (StringConstant.apiKey.isNotEmpty) {
      final result =
          await client.get(Uri.parse('${UrlPath.baseUrl}movie/$movieId/reviews'));
      response = jsonDecode(result.body);
    } else {
      response = await JsonHelper.getJson('movie_review_$movieId.json');
    }
    try {
      ReviewResponse data = ReviewResponse.fromJson(response);
      return data;
    } catch (e) {
      throw ParsingException("Something went wrong");
    }
  }
}
