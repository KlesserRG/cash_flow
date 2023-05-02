import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/pages/settings.dart';
import 'package:text_rpg_two/ui/theme/seasons/seasons.dart';
import 'package:text_rpg_two/ui/widgets/icon_btn.dart';

class CalculateBar extends StatelessWidget {
  const CalculateBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    double currentSum = model.calculateSum();
    Season season = model.currentTheme;
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      foregroundColor: Colors.white,
      flexibleSpace: Image.asset(
        season.imgUrl,
        fit: BoxFit.cover,
      ),
      expandedHeight: 120,
      leading: IconButton(
        icon: const Icon(
          Icons.settings_rounded,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const Settings(),
        ),
      ),
      bottom: AppBar(
        title: Text(
          currentSum.toString().replaceAll('.0', ''),
          style: TextStyle(color: 0 <= currentSum ? Colors.black : Colors.red),
        ),
        centerTitle: true,
        leading: IconBTN(
          activeColor: model.currentTheme.mainColor,
          isActive: model.isCard,
          icon: Icons.credit_card_rounded,
          action: () {
            model.isCard = !model.isCard;
            model.sorting();
          },
        ),
        actions: [
          IconBTN(
            activeColor: model.currentTheme.mainColor,
            isActive: model.isCash,
            icon: Icons.money_rounded,
            action: () {
              model.isCash = !model.isCash;
              model.sorting();
            },
          )
        ],
        flexibleSpace: Ink(color: season.mainColor, height: 2),
      ),
    );
  }
}
