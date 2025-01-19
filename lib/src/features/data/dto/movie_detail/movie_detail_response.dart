import 'package:json_annotation/json_annotation.dart';
import 'package:playground/src/features/domain/models/movie_detail.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'adult')
  final bool adult;
  @JsonKey(name: 'budget')
  final int budget;
  @JsonKey(name: 'homepage')
  final String? homepage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'overview')
  final String? overview;
  @JsonKey(name: 'popularity')
  final double popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  MovieDetailResponse({
    required this.id,
    required this.adult,
    required this.budget,
    this.homepage,
    required this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
  });

  MovieDetail asMovieDetailDomain() =>
      MovieDetail(id: id,
          adult: adult,
          budget: budget,
          overview: overview,
          originalTitle: originalTitle,
          popularity: popularity,
          title: title,
          posterPath: posterPath != null
              ? "https://image.tmdb.org/t/p/w300/$posterPath"
              : "",
          releaseDate: releaseDate,
          voteAverage: voteAverage
      );

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}
