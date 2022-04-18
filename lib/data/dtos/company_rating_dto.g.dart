// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_rating_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRatingDto _$CompanyRatingDtoFromJson(Map<String, dynamic> json) =>
    CompanyRatingDto()
      ..companyRating = json['CompanyRating'] as int?
      ..recommendationRating = json['RecommendationRating'] as int?
      ..missionRating = json['MissionRating'] as int?
      ..comments = json['Comments'] as String?;

Map<String, dynamic> _$CompanyRatingDtoToJson(CompanyRatingDto instance) =>
    <String, dynamic>{
      'CompanyRating': instance.companyRating,
      'RecommendationRating': instance.recommendationRating,
      'MissionRating': instance.missionRating,
      'Comments': instance.comments,
    };
