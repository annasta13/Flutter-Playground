// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseErrorBody _$ResponseErrorBodyFromJson(Map<String, dynamic> json) =>
    ResponseErrorBody(
      message: json['status_message'] as String?,
    );

Map<String, dynamic> _$ResponseErrorBodyToJson(ResponseErrorBody instance) =>
    <String, dynamic>{
      'status_message': instance.message,
    };
