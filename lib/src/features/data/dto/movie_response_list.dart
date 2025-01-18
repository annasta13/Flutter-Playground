import 'package:json_annotation/json_annotation.dart';
import 'package:playground/src/features/data/dto/movie_response_item.dart';
import 'package:playground/src/features/domain/models/movie_item.dart';
import 'package:playground/src/features/domain/models/movie_list.dart';

part 'movie_response_list.g.dart';

@JsonSerializable()
class MovieResponseList {
  @JsonKey(name: "results")
  final List<MovieResponseItem>? movieList;
  final int? page;
  final String? message;
  @JsonKey(name: "total_pages")
  final int? totalPages;

  MovieResponseList({
    this.movieList,
    this.page,
    this.message,
    this.totalPages,
  });

  static final mocked = MovieResponseList(
    movieList: [MovieResponseItem.mocked],
    page: 1,
    message: null,
    totalPages: 1,
  );

  MovieList asMovieListDomain() => MovieList(
      items: movieList?.map((element) {
            return element.asMovieItemDomain();
          }).toList() ??
          [],
      page: page,
      totalPages: totalPages,
      message: message);

  factory MovieResponseList.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseListToJson(this);
}
