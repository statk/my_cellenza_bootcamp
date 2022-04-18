import 'package:dio/dio.dart';
import 'package:my_cellenza_bootcamp/assets/constants.dart';
import 'package:my_cellenza_bootcamp/data/dtos/rating_dto.dart';
import 'package:retrofit/http.dart';

part 'rating_repository.g.dart';

@RestApi(baseUrl: baseApiUrl)
abstract class RatingRepository {
  @GET('/rating')
  Future<RatingDto> getRating(@Query('date') String date);

  @POST('/ratings')
  Future<RatingDto> postRating(@Body() RatingDto rating, @Query('date') String date);

  factory RatingRepository(Dio dio, {String? baseUrl}) => _RatingRepository(dio, baseUrl: baseUrl);
}
