// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RatingRepository implements RatingRepository {
  _RatingRepository(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://94.245.89.108:3000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RatingDto> getRating(date) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'date': date};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RatingDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/get',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RatingDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RatingDto> postRating(rating, date) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'date': date};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(rating.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RatingDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/save',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RatingDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
