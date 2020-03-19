import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/models/index.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

abstract class ConnectModel extends ChangeNotifier {
  void setFollowers(List<User> followers);
  void setFollowing(List<User> following);
  void setSelectedTabIndex(int index);

  List<User> get followers;
  List<User> get following;
  PlatformTabController get platformTabController;
  List<BottomNavigationBarItem> get bottomNavigationBarItems;
  List<Widget> get tabScreens;
  List<Tab> get tabs;
  int get selectedTabIndex;
  Widget get selectedTabScreen;
}
