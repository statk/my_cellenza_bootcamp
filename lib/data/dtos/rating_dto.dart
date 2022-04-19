import 'package:json_annotation/json_annotation.dart';
import 'package:my_cellenza_bootcamp/data/dtos/company_rating_dto.dart';
import 'package:my_cellenza_bootcamp/data/dtos/manager_rating_dto.dart';

part 'rating_dto.g.dart';

@JsonSerializable()
class RatingDto {
  @JsonKey(name: 'HasSavedData')
  bool? hasSavedData;
  @JsonKey(name: 'CanEditData')
  bool? canEditData;
  @JsonKey(name: 'ShouldEditPreviousMonth')
  bool? shouldEditPreviousMonth;
  @JsonKey(name: 'CompanyRating')
  CompanyRatingDto? companyRating;
  @JsonKey(name: 'ManagerRating')
  ManagerRatingDto? managerRating;

  static fromJson(Map<String, dynamic> map) => _$RatingDtoFromJson(map);
  Map<String, dynamic> toJson() => _$RatingDtoToJson(this);
}
