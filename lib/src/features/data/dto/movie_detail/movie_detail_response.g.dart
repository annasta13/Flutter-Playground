// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) =>
    MovieDetailResponse(
      id: (json['id'] as num).toInt(),
      adult: json['adult'] as bool,
      budget: (json['budget'] as num).toInt(),
      homepage: json['homepage'] as String?,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String,
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieDetailResponseToJson(
        MovieDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'budget': instance.budget,
      'homepage': instance.homepage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
    };
