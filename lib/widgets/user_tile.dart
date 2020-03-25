import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/models/index.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: user.avatarUrl != null
            ? CachedNetworkImageProvider(user.avatarUrl)
            : const AssetImage('assets/blank-profile.webp') as ImageProvider,
        // backgroundImage: user.avatarUrl != null
        //     ? CachedNetworkImageProvider(user.avatarUrl)
        //     : const AssetImage('assets/blank-profile.webp'),
      ),
      title: user.name != null ? Text(user.name) : const Text('N/A'),
      subtitle: user.email != null ? Text(user.email) : const Text('No email'),
    );
  }
}
