// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDto _$RatingDtoFromJson(Map<String, dynamic> json) => RatingDto()
  ..hasSavedData = json['HasSavedData'] as bool?
  ..canEditData = json['CanEditData'] as bool?
  ..shouldEditPreviousMonth = json['ShouldEditPreviousMonth'] as bool?
  ..companyRating = json['CompanyRating'] == null
      ? null
      : CompanyRatingDto.fromJson(json['CompanyRating'] as Map<String, dynamic>)
  ..managerRating = json['ManagerRating'] == null
      ? null
      : ManagerRatingDto.fromJson(
          json['ManagerRating'] as Map<String, dynamic>);

Map<String, dynamic> _$RatingDtoToJson(RatingDto instance) => <String, dynamic>{
      'HasSavedData': instance.hasSavedData,
      'CanEditData': instance.canEditData,
      'ShouldEditPreviousMonth': instance.shouldEditPreviousMonth,
      'CompanyRating': instance.companyRating,
      'ManagerRating': instance.managerRating,
    };
