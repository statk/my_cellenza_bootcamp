import 'package:dio/dio.dart';
import 'package:my_cellenza_bootcamp/assets/constants.dart';
import 'package:my_cellenza_bootcamp/data/dtos/me_dto.dart';
import 'package:retrofit/http.dart';

part 'me_repository.g.dart';

@RestApi(baseUrl: baseApiUrl)
abstract class MeRepository {
  @GET('/me')
  Future<MeDto> getMe();

  factory MeRepository(Dio dio, {String? baseUrl}) => _MeRepository(dio, baseUrl: baseUrl);
}
