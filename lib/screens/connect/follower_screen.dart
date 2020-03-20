import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_graphql/library/queries.dart';
import 'package:flutter_github_graphql/models/index.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(getFollowersQuery),
        variables: <String, dynamic>{'first': 10},
      ),
      builder: (
        QueryResult result, {
        VoidCallback refetch,
        FetchMore fetchMore,
      }) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.loading) {
          return const Text('Loading');
        }

        print('results here');
        print(result.data);

        final List<User> followers = (result.data['viewer']['followers']
                ['nodes'] as List<dynamic>)
            .map((dynamic node) => User.fromJson(node as Map<String, dynamic>))
            .toList();

        return ListView.builder(
          itemCount: followers.length,
          itemBuilder: (BuildContext context, int index) {
            final User follower = followers[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(follower.avatarUrl),
              ),
              title: follower.name != null
                  ? Text(follower.name)
                  : const Text('N/A'),
              subtitle: Text(follower.email),
            );
          },
        );
      },
    );
  }
}
