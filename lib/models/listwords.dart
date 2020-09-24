import 'package:json_annotation/json_annotation.dart';

part 'listwords.g.dart';

@JsonSerializable()
class ListWords {
  @JsonKey()
  String userId;
  @JsonKey()
  String id;
  @JsonKey()
  String title;
  @JsonKey()
  String body;

  ListWords() ;

  factory ListWords.fromJson(Map<String, dynamic> json) => _$ListWordsFromJson(json);

  Map<String, dynamic> toJson() => _$ListWordsToJson(this);
}
