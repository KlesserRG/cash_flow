import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/widgets/calculate_bar.dart';
import 'package:text_rpg_two/ui/widgets/history_list.dart';
import 'package:text_rpg_two/ui/widgets/icon_btn.dart';
import 'package:text_rpg_two/ui/widgets/show_alert.dart';
import 'package:text_rpg_two/ui/widgets/statistic_bar.dart';

// ignore: must_be_immutable
class MainMenu extends StatelessWidget {
  MainMenu({super.key});

  bool firstStart = true;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    model.putData();
    if (firstStart == true) {
      model.firstSorting();
      model.takeTheme();
      firstStart = false;
    }
    model.statistic();

    // Интеграция и сортировка данных

    return Scaffold(
      floatingActionButton: IconBTN(
        isBackground: true,
        activeColor: model.currentTheme.mainColor,
        icon: Icons.add,
        action: () => showDialog(
            context: context, builder: (context) => const ShowAlert()),
      ),
      body: const CustomScrollView(
        slivers: [
          CalculateBar(),
          StatisticBar(),
          HistoryList(),
        ],
      ),
    );
  }
}
