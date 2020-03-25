import 'package:flutter_github_graphql/library/graphql-client.dart';
import 'package:flutter_github_graphql/library/queries.dart';
import 'package:flutter_github_graphql/models/user.dart';
import 'package:flutter_github_graphql/view_models/search/search_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SearchModelImplementation extends SearchModel {
  final GraphQLClient client = getGraphQLClient();

  @override
  List<User> get searchResults => null;

  @override
  Future<List<User>> searchUser(String userQuery) async {
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(searchQuery),
      variables: <String, dynamic>{
        'query': userQuery,
        'type': 'USER',
        'first': 20,
      },
      fetchResults: true,
      pollInterval: 4,
    );

    final QueryResult queryResults = await client.query(_options);

    final List<User> users =
        (queryResults.data['search']['edges'] as List<dynamic>)
            .map((dynamic node) =>
                User.fromJson(node['node'] as Map<String, dynamic>))
            .toList();

    return Future<List<User>>.value(users);
  }
}
