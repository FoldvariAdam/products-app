import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  ReviewResponse({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}
