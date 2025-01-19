import 'package:json_annotation/json_annotation.dart';
import 'package:playground/src/features/domain/models/review.dart';

import 'avatar_response.dart';

part 'review_response_item.g.dart';

@JsonSerializable()
class ReviewResponseItem {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'author')
  final String author;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'author_details')
  final AvatarResponse authorDetails;

  ReviewResponseItem({
    required this.id,
    required this.author,
    required this.content,
    required this.authorDetails,
  });

  Review asReviewDomain() => Review(
        id: id,
        author: author,
        content: content,
        avatarPath: authorDetails.avatarPath != null
            ? "https://image.tmdb.org/t/p/w300/${authorDetails.avatarPath}"
            : "",
        rating: authorDetails.rating ?? 0.0,
      );

  factory ReviewResponseItem.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewResponseItemToJson(this);
}
