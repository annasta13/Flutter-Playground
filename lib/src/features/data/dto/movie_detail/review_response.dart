import 'package:json_annotation/json_annotation.dart';
import 'package:playground/src/features/data/dto/movie_detail/review_response_item.dart';
import 'package:playground/src/features/domain/models/review.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse {
  @JsonKey(name: 'results')
  final List<ReviewResponseItem> items;

  ReviewResponse(this.items);

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  List<Review> asReviewListDomain() =>
      items.map((element) {
        return element.asReviewDomain();
      }).toList();

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}
