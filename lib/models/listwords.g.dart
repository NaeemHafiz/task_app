// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listwords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWords _$ListWordsFromJson(Map<String, dynamic> json) {
  return ListWords()
    ..userId = json['userId'] as String
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..body = json['body'] as String;
}

Map<String, dynamic> _$ListWordsToJson(ListWords instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
