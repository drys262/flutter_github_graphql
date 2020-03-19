import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_graphql/view_models/app/app_model.dart';
import 'package:flutter_github_graphql/screens/connect/connect_screen.dart';
import 'package:flutter_github_graphql/screens/home/home_screen.dart';
import 'package:flutter_github_graphql/screens/profile/profile_screen.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppModelImplementation extends AppModel {
  int _selectedNavigationIndex = 0;
  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const ConnectScreen(),
    const ProfileScreen()
  ];
  final List<PlatformAppBar> _platformAppBars = <PlatformAppBar>[
    PlatformAppBar(
      title: const Text('Home'),
    ),
    null,
    PlatformAppBar(
      title: const Text('Profile'),
    ),
  ];

  @override
  int get selectedNavigationIndex => _selectedNavigationIndex;

  @override
  Widget get selectedScreen => _screens[_selectedNavigationIndex];

  @override
  void setSelectedNavigationIndex(int index) {
    _selectedNavigationIndex = index;
    notifyListeners();
  }

  @override
  PlatformAppBar get selectedPlatformAppBar =>
      _platformAppBars[_selectedNavigationIndex];
}
