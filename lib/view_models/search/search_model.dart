import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/models/index.dart';

abstract class SearchModel extends ChangeNotifier {
  Future<List<User>> searchUser(String userQuery);

  List<User> get searchResults;
}
