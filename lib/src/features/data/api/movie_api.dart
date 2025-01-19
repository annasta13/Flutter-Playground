import 'package:playground/src/features/data/dto/movie_detail/movie_detail_response.dart';
import 'package:playground/src/features/data/dto/movie_list/movie_response_list.dart';

import '../dto/movie_detail/review_response.dart';

abstract class MovieApi {
  Future<MovieResponseList> fetchMovieList(String urlPath, int page);

  Future<MovieDetailResponse> fetchMovieDetail(int movieId);

  Future<ReviewResponse> fetchMovieReview(int movieId);
}
