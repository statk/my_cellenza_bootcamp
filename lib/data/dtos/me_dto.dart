import 'package:json_annotation/json_annotation.dart';

part 'me_dto.g.dart';

@JsonSerializable()
class MeDto {
  @JsonKey(name: 'Id')
  String id;
  @JsonKey(name: 'DisplayName')
  String displayName;
  @JsonKey(name: 'GivenName')
  String givenName;
  @JsonKey(name: 'Surname')
  String surname;
  @JsonKey(name: 'Position')
  String position;
  @JsonKey(name: 'Initials')
  String initials;
  MeDto(this.id, this.displayName, this.givenName, this.surname, this.position, this.initials);

  static fromJson(Map<String, dynamic> map) => _$MeDtoFromJson(map);
}
