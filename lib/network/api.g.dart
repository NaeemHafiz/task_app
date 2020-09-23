// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClass implements ApiClass {
  _ApiClass(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://mansoor.letout.com.pk/idealz/public/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  login(loginParams) async {
    ArgumentError.checkNotNull(loginParams, 'loginParams');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginParams?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseModel.fromJson(_result.data);
    return value;
  }
}
