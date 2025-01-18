import 'package:dartz/dartz.dart';
import 'package:playground/src/features/data/dto/api_error.dart';

import '../models/movie_list.dart';

abstract class MovieRepository {
  Future<Either<ApiError, MovieList>> fetchMovies(String urlPath, int page);
}
