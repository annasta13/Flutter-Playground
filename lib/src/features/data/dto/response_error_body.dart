import 'package:json_annotation/json_annotation.dart';

part 'response_error_body.g.dart';

@JsonSerializable()
class ResponseErrorBody {
  @JsonKey(name: 'status_message')
  final String? message;

  ResponseErrorBody({
    this.message,
  });

  factory ResponseErrorBody.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseErrorBodyToJson(this);
}
