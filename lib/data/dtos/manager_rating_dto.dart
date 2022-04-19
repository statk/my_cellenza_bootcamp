import 'package:json_annotation/json_annotation.dart';

part 'manager_rating_dto.g.dart';

@JsonSerializable()
class ManagerRatingDto {
  @JsonKey(name: 'ManagerRating')
  int? managerRating;
  @JsonKey(name: 'PositiveComments')
  String? positiveComments;
  @JsonKey(name: 'NegativeComments')
  String? negativeComments;

  static fromJson(Map<String, dynamic> json) => _$ManagerRatingDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ManagerRatingDtoToJson(this);
}
