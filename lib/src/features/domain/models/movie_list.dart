import 'package:playground/src/features/domain/models/movie_item.dart';

class MovieList {
  final List<MovieItem> items;
  final int? page;
  final String? message;
  final int? totalPages;

  MovieList({
    required this.items,
    this.page,
    this.message,
    this.totalPages,
  });
}
