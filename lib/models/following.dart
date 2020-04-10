import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
part 'following.g.dart';

@JsonSerializable()
class Following {
  Following();

  List<User> followings;

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);
  Map<String, dynamic> toJson() => _$FollowingToJson(this);
}
