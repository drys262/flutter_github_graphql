import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

abstract class AppModel extends ChangeNotifier {
  void setSelectedNavigationIndex(int index);

  int get selectedNavigationIndex;

  Widget get selectedScreen;

  PlatformAppBar get selectedPlatformAppBar;
}
