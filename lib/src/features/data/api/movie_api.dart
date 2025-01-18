import 'package:playground/src/features/data/dto/movie_response_list.dart';

abstract class MovieApi {
  Future<MovieResponseList> getMovieList(String urlPath, int page);
}
