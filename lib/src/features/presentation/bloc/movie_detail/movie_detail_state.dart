import 'package:playground/src/features/domain/models/movie_detail_and_review.dart';

abstract class MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final int? expandedReviewId;
  final MovieDetailAndReview movieDetailAndReview;

  MovieDetailSuccess({required this.movieDetailAndReview, this.expandedReviewId});
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);
}
