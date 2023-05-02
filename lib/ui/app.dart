import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/navigator/app_navigator.dart';
import 'package:text_rpg_two/ui/navigator/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.mainPage,
        routes: AppNavigator.appNavigators,
      ),
    );
  }
}