// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..databaseId = json['databaseId'] as num
    ..avatarUrl = json['avatarUrl'] as String
    ..email = json['email'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'databaseId': instance.databaseId,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'name': instance.name
    };
