import 'package:flutter/widgets.dart';
import 'package:flutter_github_graphql/view_models/app/app_model.dart';
import 'package:flutter_github_graphql/widgets/bottom_navigation_bar_items.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      home: Consumer<AppModel>(
        builder: (BuildContext context, AppModel model, Widget child) {
          return PlatformScaffold(
            appBar: model.selectedPlatformAppBar,
            body: model.selectedScreen,
            bottomNavBar: PlatformNavBar(
              items: getBottomNavigationBarItems(),
              currentIndex: model.selectedNavigationIndex,
              itemChanged: (int index) =>
                  model.setSelectedNavigationIndex(index),
            ),
          );
        },
      ),
    );
  }
}
