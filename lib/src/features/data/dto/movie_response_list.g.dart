// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseList _$MovieResponseListFromJson(Map<String, dynamic> json) =>
    MovieResponseList(
      movieList: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieResponseListToJson(MovieResponseList instance) =>
    <String, dynamic>{
      'results': instance.movieList,
      'page': instance.page,
      'message': instance.message,
      'total_pages': instance.totalPages,
    };
