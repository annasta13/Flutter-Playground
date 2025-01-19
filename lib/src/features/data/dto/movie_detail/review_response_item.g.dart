// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponseItem _$ReviewResponseItemFromJson(Map<String, dynamic> json) =>
    ReviewResponseItem(
      id: json['id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      authorDetails: AvatarResponse.fromJson(
          json['author_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewResponseItemToJson(ReviewResponseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'author_details': instance.authorDetails,
    };
