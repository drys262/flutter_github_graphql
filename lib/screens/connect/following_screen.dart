import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_graphql/library/queries.dart';
import 'package:flutter_github_graphql/models/index.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(getFollowingsQuery),
        variables: <String, dynamic>{
          'first': 10,
        },
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

        final List<User> followings = (result.data['viewer']['following']
                ['nodes'] as List<dynamic>)
            .map((dynamic node) => User.fromJson(node as Map<String, dynamic>))
            .toList();

        return ListView.builder(
          itemCount: followings.length,
          itemBuilder: (BuildContext context, int index) {
            final User following = followings[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(following.avatarUrl),
              ),
              title: following.name != null
                  ? Text(following.name)
                  : const Text('N/A'),
              subtitle: Text(following.email),
            );
          },
        );
      },
    );
  }
}
