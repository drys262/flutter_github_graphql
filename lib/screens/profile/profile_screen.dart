import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_graphql/view_models/profile/profile_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Consumer<ProfileModel>(
      builder: (BuildContext context, ProfileModel model, Widget _) {
        return Stack(
          children: <Widget>[
            Container(
              color: Colors.blue,
            ),
            if (model.isFetchingUser)
              const CircularProgressIndicator(
                strokeWidth: 2,
              )
            else
              CachedNetworkImage(
                imageUrl: model.currentUser.avatarUrl,
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
                        backgroundImage: (model.isFetchingUser
                            ? const AssetImage('assets/blank-profile.webp')
                            : CachedNetworkImageProvider(
                                model.currentUser.avatarUrl)) as ImageProvider,
                      ),
                      SizedBox(
                        height: _height / 25.0,
                      ),
                      Text(
                        model.isFetchingUser
                            ? 'loading ...'
                            : model.currentUser.name ?? 'N/A',
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
                          rowCell(
                              model.isFetchingUser
                                  ? 0
                                  : model.currentUser.repositories['totalCount']
                                      as int,
                              'REPOSITORIES'),
                          rowCell(
                              model.isFetchingUser
                                  ? 0
                                  : model.currentUser.followers['totalCount']
                                      as int,
                              'FOLLOWERS'),
                          rowCell(
                              model.isFetchingUser
                                  ? 0
                                  : model.currentUser.following['totalCount']
                                      as int,
                              'FOLLOWING'),
                        ],
                      ),
                      Divider(height: _height / 30, color: Colors.white),
                    ],
                  ),
                ))
          ],
        );
      },
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
