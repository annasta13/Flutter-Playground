abstract class MovieDetailEvent {}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int movieId;

  GetMovieDetailEvent({required this.movieId});
}

class ExpandReviewEvent extends MovieDetailEvent {
  final int? reviewId;

  ExpandReviewEvent({this.reviewId});
}
