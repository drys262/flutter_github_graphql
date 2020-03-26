import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    num databaseId;
    String avatarUrl;
    String email;
    String name;
    String login;
    Map<String,dynamic> followers;
    Map<String,dynamic> following;
    Map<String,dynamic> repositories;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
