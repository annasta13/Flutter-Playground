import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/movie_item.dart';

part 'movie_response_item.g.dart';

@JsonSerializable()
class MovieResponseItem {
  final int id;
  @JsonKey(name: "original_title")
  final String originalTitle;
  final String overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date")
  final String releaseDate;

  MovieResponseItem({
    required this.id,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.releaseDate,
  });

  //
  factory MovieResponseItem.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseItemFromJson(json);

  toJson() => _$MovieResponseItemToJson(this);

  MovieItem asMovieItemDomain() {
    return MovieItem(
      movieId: id,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath != null
          ? "https://image.tmdb.org/t/p/w300/$posterPath"
          : "",
      releaseDate: releaseDate,
    );
  }

  static List<MovieResponseItem> fromJsonList(List? json) {
    return json?.map((e) => MovieResponseItem.fromJson(e)).toList() ?? [];
  }
}
