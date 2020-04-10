import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/models/index.dart';
import 'package:flutter_github_graphql/screens/profile/user_profile_screen.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => UserProfileScreen(
              currentUser: user,
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: user.avatarUrl != null
              ? CachedNetworkImageProvider(user.avatarUrl)
              : const AssetImage('assets/blank-profile.webp') as ImageProvider,
        ),
        title: user.name != null ? Text(user.name) : const Text('N/A'),
        subtitle:
            user.email != null ? Text(user.email) : const Text('No email'),
      ),
    );
  }
}
