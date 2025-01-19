import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/avatar.dart';

part 'avatar_response.g.dart';

@JsonSerializable()
class AvatarResponse {
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;

  @JsonKey(name: 'rating')
  final double? rating;

  AvatarResponse({this.avatarPath, this.rating});

  Avatar asAvatarDomain() => Avatar(avatarPath: avatarPath, rating: rating);

  factory AvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$AvatarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarResponseToJson(this);
}
