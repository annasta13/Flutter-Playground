import 'package:playground/src/features/domain/models/movie_item.dart';

abstract class MovieListState {}
// class MovieListState extends AppState<List<MovieItem>> {
//   bool hasMore = false;
//
//   MovieListState.error(super.errorMessage) : super.error();
//
//   MovieListState.loading() : super.loading();
//
//   MovieListState.success(List<MovieItem> super.data, this.hasMore)
//       : super.success();
// // MovieListState.success(super.data) : super.success(data);
// }
//
class MovieSuccess extends MovieListState {
  final List<MovieItem> movies;
  final bool hasMore; // Indicates if there are more pages

  MovieSuccess(this.movies, this.hasMore);
}

class MovieLoading implements MovieListState{}

class MovieError extends MovieListState {
  final String message;

  MovieError(this.message);
}
