import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/models/index.dart';

class UserProfileScreen extends StatelessWidget {
  final User currentUser;

  const UserProfileScreen({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.blue,
        ),
        CachedNetworkImage(
          imageUrl: currentUser.avatarUrl,
          fit: BoxFit.fill,
        ),
        BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            drawer: Drawer(
              child: Container(),
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _height / 12,
                  ),
                  CircleAvatar(
                    radius: _width < _height ? _width / 4 : _height / 4,
                    backgroundImage:
                        CachedNetworkImageProvider(currentUser.avatarUrl),
                  ),
                  SizedBox(
                    height: _height / 25.0,
                  ),
                  Text(
                    currentUser.name ?? 'N/A',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  ),
                  Divider(
                    height: _height / 30,
                    color: Colors.white,
                  ),
                  Row(
                    children: <Widget>[
                      rowCell(currentUser.repositories['totalCount'] as int,
                          'REPOSITORIES'),
                      rowCell(currentUser.followers['totalCount'] as int,
                          'FOLLOWERS'),
                      rowCell(currentUser.following['totalCount'] as int,
                          'FOLLOWING'),
                    ],
                  ),
                  Divider(height: _height / 30, color: Colors.white),
                ],
              ),
            ))
      ],
    );
  }

  Widget rowCell(int count, String type) => Expanded(
        child: Column(
          children: <Widget>[
            Text(
              '$count',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              type,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      );
}
