import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:playground/src/features/data/api/movie_api.dart';
import 'package:playground/src/features/domain/models/movie_list.dart';
import 'package:playground/src/features/domain/repositories/movie_repository.dart';

import '../dto/api_error.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApi movieApi;

  MovieRepositoryImpl(this.movieApi);

  @override
  Future<Either<ApiError, MovieList>> fetchMovies(
      String urlPath, int page) async {
    try {
      final result = await movieApi.getMovieList(urlPath, page);
      return Right(result.asMovieListDomain());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }
}
