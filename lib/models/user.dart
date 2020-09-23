import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey()
  int id;
  @JsonKey()
  String first_name;
  @JsonKey()
  String last_name;
  @JsonKey()
  String username;
  @JsonKey()
  String email;
  @JsonKey()
  String email_verified_at;
  @JsonKey()
  String user_type;
  @JsonKey()
  String phone_number;
  @JsonKey()
  String profile_image;
  @JsonKey()
  String login_type;
  @JsonKey()
  String status;
  @JsonKey()
  String address;
  @JsonKey()
  String delivery_address;
  @JsonKey()
  String created_at;
  @JsonKey()
  String updated_at;
  @JsonKey()
  String access_token;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
