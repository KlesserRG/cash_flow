import 'package:flutter/cupertino.dart';
import 'package:text_rpg_two/ui/navigator/app_routes.dart';
import 'package:text_rpg_two/ui/pages/main_menu.dart';

abstract class AppNavigator {
  static Map<String, Widget Function(BuildContext)> appNavigators = {
    AppRoutes.mainPage: (context) => MainMenu(),
  };
}
