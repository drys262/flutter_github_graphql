import 'package:flutter/cupertino.dart';
import 'package:flutter_github_graphql/models/index.dart';

abstract class ProfileModel extends ChangeNotifier {
  Future<void> getUserProfile();

  User get currentUser;

  bool get isFetchingUser;
}
