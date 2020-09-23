import 'package:json_annotation/json_annotation.dart';

part 'loginparams.g.dart';

@JsonSerializable()
class LoginParams{
  @JsonKey()
  String username;
  @JsonKey()
  String password;

  LoginParams();

  factory LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);

}