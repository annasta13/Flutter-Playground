// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseItem _$MovieResponseItemFromJson(Map<String, dynamic> json) =>
    MovieResponseItem(
      id: (json['id'] as num).toInt(),
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String,
    );

Map<String, dynamic> _$MovieResponseItemToJson(MovieResponseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
    };
