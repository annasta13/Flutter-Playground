import 'package:dartz/dartz.dart';
import 'package:playground/src/features/data/dto/api_error.dart';
import 'package:playground/src/features/domain/models/movie_detail.dart';
import 'package:playground/src/features/domain/models/review.dart';

import '../models/movie_list.dart';

abstract class MovieRepository {
  Future<Either<ApiError, MovieList>> fetchMovieList(String urlPath, int page);

  Future<Either<ApiError, MovieDetail>> fetchMovieDetail(int movieId);

  Future<Either<ApiError, List<Review>>> fetchMovieReview(int movieId);
}
