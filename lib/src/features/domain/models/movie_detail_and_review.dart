import 'package:playground/src/features/domain/models/movie_detail.dart';
import 'package:playground/src/features/domain/models/review.dart';

class MovieDetailAndReview {
  final MovieDetail movieDetail;
  final List<Review> reviewList;

  MovieDetailAndReview({required this.movieDetail, required this.reviewList});
}
