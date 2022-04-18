import 'package:json_annotation/json_annotation.dart';

part 'company_rating_dto.g.dart';

@JsonSerializable()
class CompanyRatingDto {
  @JsonKey(name: 'CompanyRating')
  int? companyRating;
  @JsonKey(name: 'RecommendationRating')
  int? recommendationRating;
  @JsonKey(name: 'MissionRating')
  int? missionRating;
  @JsonKey(name: 'Comments')
  String? comments;

  static fromJson(Map<String, dynamic> json) => _$CompanyRatingDtoFromJson(json);
}
