import 'package:flutter_github_graphql/library/graphql-client.dart';
import 'package:flutter_github_graphql/library/queries.dart';
import 'package:flutter_github_graphql/models/user.dart';
import 'package:flutter_github_graphql/view_models/profile/profile_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProfileModelImplementation extends ProfileModel {
  final GraphQLClient client = getGraphQLClient();

  User _currentUser;

  bool _isFetchingUser = false;

  ProfileModelImplementation() {
    loading();
    getUserProfile();
  }

  @override
  User get currentUser => _currentUser;

  void loading() {
    _isFetchingUser = true;
    notifyListeners();
  }

  @override
  Future<void> getUserProfile() async {
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(getUserProfileQuery),
      fetchResults: true,
      pollInterval: 4,
    );

    final QueryResult queryResults = await client.query(_options);

    final User user =
        User.fromJson(queryResults.data['viewer'] as Map<String, dynamic>);

    _currentUser = user;
    _isFetchingUser = false;
    notifyListeners();
  }

  @override
  bool get isFetchingUser => _isFetchingUser;
}
