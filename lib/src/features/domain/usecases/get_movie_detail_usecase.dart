import 'package:dartz/dartz.dart';

import '../../data/dto/api_error.dart';
import '../models/movie_detail_and_review.dart';
import '../repositories/movie_repository.dart';

abstract class GetMovieDetailUseCase {
  Future<Either<ApiError, MovieDetailAndReview>> getMovieDetailAndReview(
      int movieId);
}

class GetMovieDetailUseCaseImpl extends GetMovieDetailUseCase {
  final MovieRepository movieRepository;

  GetMovieDetailUseCaseImpl(this.movieRepository);

  @override
  Future<Either<ApiError, MovieDetailAndReview>> getMovieDetailAndReview(
      int movieId) async {

    // Fetch movie detail
    final movieDetailResult = await movieRepository.fetchMovieDetail(movieId);

    // Check if fetching movie details resulted in an error
    if (movieDetailResult.isLeft()) {
      return Left(movieDetailResult.swap().getOrElse(
          () => ApiError(statusCode: 500, message: "Error occurred")));
    }

    // Fetch movie reviews
    final reviewListResult = await movieRepository.fetchMovieReview(movieId);

    // Check if fetching reviews resulted in an error
    if (reviewListResult.isLeft()) {
      return Left(reviewListResult.swap().getOrElse(
          () => ApiError(statusCode: 500, message: "Error occurred")));
    }

    // Combine the results if both succeed
    final movieDetail =
        movieDetailResult.getOrElse(() => throw Exception("Unexpected error occurs"));
    final reviewList =
        reviewListResult.getOrElse(() => throw Exception("Unexpected error occurs"));

    return Right(MovieDetailAndReview(
      movieDetail: movieDetail,
      reviewList: reviewList,
    ));
  }
}
