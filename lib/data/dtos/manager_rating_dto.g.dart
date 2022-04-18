// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagerRatingDto _$ManagerRatingDtoFromJson(Map<String, dynamic> json) =>
    ManagerRatingDto()
      ..managerRating = json['ManagerRating'] as int?
      ..positiveComments = json['PositiveComments'] as String?
      ..negativeComments = json['NegativeComments'] as String?;

Map<String, dynamic> _$ManagerRatingDtoToJson(ManagerRatingDto instance) =>
    <String, dynamic>{
      'ManagerRating': instance.managerRating,
      'PositiveComments': instance.positiveComments,
      'NegativeComments': instance.negativeComments,
    };
