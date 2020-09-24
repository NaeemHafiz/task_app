import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task_app/utils/utils.dart';

import '../models/basemodel.dart';
import '../models/loginparams.dart';

part 'api.g.dart';

@RestApi(baseUrl: Utils.url)
abstract class ApiClass {
  factory ApiClass(Dio dio, {String baseUrl}) = _ApiClass;

  @POST("login")
  Future<BaseModel> login(@Body() LoginParams loginParams);
}
