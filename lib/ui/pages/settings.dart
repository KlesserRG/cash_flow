import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/theme/seasons/seasons.dart';
import 'package:text_rpg_two/ui/theme/seasons/seasons_path.dart';

class Settings extends StatelessWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    Season currentSeason = model.currentTheme;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: Row(
        children: const [
          Spacer(),
          Text('Settings'),
          Spacer(),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Choose theme:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SPRING
                SettingsChooseBtn(
                  index: 0,
                  curIndex: currentSeason.index,
                  bgColor: Colors.pink,
                  action: () => model.setTheme(SeasonsPath.spring),
                ),
                // SUMMER
                SettingsChooseBtn(
                  index: 1,
                  curIndex: currentSeason.index,
                  bgColor: Colors.green,
                  action: () => model.setTheme(SeasonsPath.summer),
                ),
                // AUTUMN
                SettingsChooseBtn(
                  index: 2,
                  curIndex: currentSeason.index,
                  bgColor: Colors.red,
                  action: () => model.setTheme(SeasonsPath.autumn),
                ),
                // WINTER
                SettingsChooseBtn(
                  index: 3,
                  curIndex: currentSeason.index,
                  bgColor: Colors.cyan,
                  action: () => model.setTheme(SeasonsPath.winter),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsChooseBtn extends StatelessWidget {
  final int index;
  final int curIndex;
  final Color bgColor;
  final Icon icon;
  final Function() action;
  const SettingsChooseBtn({
    super.key,
    required this.action,
    required this.index,
    required this.curIndex,
    this.bgColor = Colors.black,
    this.icon = const Icon(
      Icons.abc,
      color: Colors.transparent,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(bgColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: index == curIndex
                ? const BorderSide(color: Colors.black, width: 2)
                : const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      onPressed: action,
    );
  }
}
