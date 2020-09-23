import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'basemodel.g.dart';

@JsonSerializable()
class BaseModel {
  @JsonKey()
  int code;
  @JsonKey()
  String message;
  @JsonKey()
  Data data;

  BaseModel();

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
