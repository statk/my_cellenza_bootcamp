// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeDto _$MeDtoFromJson(Map<String, dynamic> json) => MeDto(
      json['Id'] as String,
      json['DisplayName'] as String,
      json['GivenName'] as String,
      json['Surname'] as String,
      json['Position'] as String,
      json['Initials'] as String,
    );

Map<String, dynamic> _$MeDtoToJson(MeDto instance) => <String, dynamic>{
      'Id': instance.id,
      'DisplayName': instance.displayName,
      'GivenName': instance.givenName,
      'Surname': instance.surname,
      'Position': instance.position,
      'Initials': instance.initials,
    };
