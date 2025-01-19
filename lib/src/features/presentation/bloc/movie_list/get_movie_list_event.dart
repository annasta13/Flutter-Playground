abstract class MovieListEvent {}

class GetMovieListEvent extends MovieListEvent {
  final String urlPath;
  final int page;

  GetMovieListEvent(this.urlPath, this.page);
}
