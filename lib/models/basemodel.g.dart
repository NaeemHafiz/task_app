// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel()
    ..code = json['code'] as int
    ..message = json['message'] as String
    ..data = json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
