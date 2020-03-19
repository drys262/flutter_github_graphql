import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_graphql/config/service_locator.dart';
import 'package:flutter_github_graphql/view_models/connect/connect_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key key}) : super(key: key);

  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ConnectModel connectModel = locator<ConnectModel>();

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Connect'),
        android: (BuildContext context) => MaterialAppBarData(
          bottom: TabBar(
            controller: _controller,
            tabs: connectModel.tabs,
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: connectModel.tabScreens,
      ),
    );
  }
}
