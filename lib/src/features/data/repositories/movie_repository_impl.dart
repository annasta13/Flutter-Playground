import 'package:dartz/dartz.dart';
import 'package:playground/src/features/data/api/movie_api.dart';
import 'package:playground/src/features/domain/models/movie_detail.dart';
import 'package:playground/src/features/domain/models/movie_list.dart';
import 'package:playground/src/features/domain/models/review.dart';
import 'package:playground/src/features/domain/repositories/movie_repository.dart';

import '../dto/api_error.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApi movieApi;

  MovieRepositoryImpl(this.movieApi);

  @override
  Future<Either<ApiError, MovieList>> fetchMovieList(
      String urlPath, int page) async {
    try {
      final result = await movieApi.fetchMovieList(urlPath, page);
      return Right(result.asMovieListDomain());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<ApiError, MovieDetail>> fetchMovieDetail(int movieId) async {
    try {
      final result = await movieApi.fetchMovieDetail(movieId);
      return Right(result.asMovieDetailDomain());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<ApiError, List<Review>>> fetchMovieReview(int movieId) async {
    try {
      final result = await movieApi.fetchMovieReview(movieId);
      return Right(result.asReviewListDomain());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }
}
