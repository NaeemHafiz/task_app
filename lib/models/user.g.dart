// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..first_name = json['first_name'] as String
    ..last_name = json['last_name'] as String
    ..username = json['username'] as String
    ..email = json['email'] as String
    ..email_verified_at = json['email_verified_at'] as String
    ..user_type = json['user_type'] as String
    ..phone_number = json['phone_number'] as String
    ..profile_image = json['profile_image'] as String
    ..login_type = json['login_type'] as String
    ..status = json['status'] as String
    ..address = json['address'] as String
    ..delivery_address = json['delivery_address'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..access_token = json['access_token'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'username': instance.username,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'user_type': instance.user_type,
      'phone_number': instance.phone_number,
      'profile_image': instance.profile_image,
      'login_type': instance.login_type,
      'status': instance.status,
      'address': instance.address,
      'delivery_address': instance.delivery_address,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'access_token': instance.access_token,
    };
