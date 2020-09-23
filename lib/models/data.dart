import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/models/user.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey()
  User user;

  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
