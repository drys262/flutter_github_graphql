import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
part 'follower.g.dart';

@JsonSerializable()
class Follower {
  Follower();

  List<User> followers;

  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);
  Map<String, dynamic> toJson() => _$FollowerToJson(this);
}
