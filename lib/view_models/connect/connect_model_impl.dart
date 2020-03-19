import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/models/index.dart';
import 'package:flutter_github_graphql/view_models/connect/connect_model.dart';
import 'package:flutter_github_graphql/screens/connect/follower_screen.dart';
import 'package:flutter_github_graphql/screens/connect/following_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConnectModelImplementation extends ConnectModel {
  List<User> _followers;
  List<User> _following;
  final PlatformTabController _platformTabController =
      PlatformTabController(initialIndex: 1);
  int _selectedTabIndex = 0;
  final List<Widget> _tabScreens = <Widget>[
    const FollowerScreen(),
    const FollowingScreen()
  ];
  final List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      title: const Text('Followers'),
      icon: Icon(Icons.people_outline),
    ),
    BottomNavigationBarItem(
      title: const Text('Following'),
      icon: Icon(Icons.person_pin),
    ),
  ];
  final List<Tab> _tabs = <Tab>[
    const Tab(child: Text('Follower')),
    const Tab(child: Text('Following')),
  ];

  @override
  List<User> get followers => _followers;

  @override
  List<User> get following => _following;

  @override
  void setFollowers(List<User> followers) {
    _followers = followers;
    notifyListeners();
  }

  @override
  void setFollowing(List<User> following) {
    _following = following;
    notifyListeners();
  }

  @override
  PlatformTabController get platformTabController => _platformTabController;

  @override
  List<BottomNavigationBarItem> get bottomNavigationBarItems => _items;

  @override
  int get selectedTabIndex => _selectedTabIndex;

  @override
  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  @override
  Widget get selectedTabScreen => _tabScreens[_selectedTabIndex];

  @override
  List<Widget> get tabScreens => _tabScreens;

  @override
  List<Tab> get tabs => _tabs;
}
