import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/theme/app_icons.dart';
import 'package:text_rpg_two/ui/widgets/icon_btn.dart';

class StatisticBar extends StatelessWidget {
  const StatisticBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    return SliverAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <IconBTN>[
          IconBTN(
            isActive: model.isHome,
            activeColor: model.currentTheme.mainColor,
            icon: AppIcons.home,
            action: () {
              model.isHome = !model.isHome;
              model.sorting();
            },
          ),
          IconBTN(
            isActive: model.isShop,
            activeColor: model.currentTheme.mainColor,
            icon: AppIcons.shop,
            action: () {
              model.isShop = !model.isShop;
              model.sorting();
            },
          ),
          IconBTN(
            isActive: model.isCar,
            activeColor: model.currentTheme.mainColor,
            icon: AppIcons.car,
            action: () {
              model.isCar = !model.isCar;
              model.sorting();
            },
          ),
          IconBTN(
            isActive: model.isWeb,
            activeColor: model.currentTheme.mainColor,
            icon: AppIcons.web,
            action: () {
              model.isWeb = !model.isWeb;
              model.sorting();
            },
          ),
          IconBTN(
            isActive: model.isGift,
            activeColor: model.currentTheme.mainColor,
            icon: AppIcons.gift,
            action: () {
              model.isGift = !model.isGift;
              model.sorting();
            },
          ),
          IconBTN(
            isActive: model.isBeach,
            activeColor: model.currentTheme.mainColor,
            icon: AppIcons.beach,
            action: () {
              model.isBeach = !model.isBeach;
              model.sorting();
            },
          ),
        ],
      ),
      centerTitle: true,
      title: model.data.isEmpty
          ? const Text('Add new items')
          : model.chechOptions() == true
              ? Text(model.sortedSum().toString().replaceAll('.0', ''))
              : Row(
                  children: [
                    Expanded(
                      flex: model.homeStat.toInt(),
                      child: Ink(
                        color: model.currentTheme.mainColor,
                        height: 40,
                        child: model.homeStat != 0
                            ? Icon(
                                AppIcons.home,
                                color: model.currentTheme.secondColor,
                              )
                            : null,
                      ),
                    ),
                    Expanded(
                      flex: model.shopStat.toInt(),
                      child: Ink(
                        color: model.currentTheme.secondColor,
                        height: 40,
                        child: model.shopStat != 0
                            ? Icon(
                                AppIcons.shop,
                                color: model.currentTheme.mainColor,
                              )
                            : null,
                      ),
                    ),
                    Expanded(
                      flex: model.carStat.toInt(),
                      child: Ink(
                        color: model.currentTheme.mainColor,
                        height: 40,
                        child: model.carStat != 0
                            ? Icon(
                                AppIcons.car,
                                color: model.currentTheme.secondColor,
                              )
                            : null,
                      ),
                    ),
                    Expanded(
                      flex: model.webStat.toInt(),
                      child: Ink(
                        color: model.currentTheme.secondColor,
                        height: 40,
                        child: model.webStat != 0
                            ? Icon(
                                AppIcons.web,
                                color: model.currentTheme.mainColor,
                              )
                            : null,
                      ),
                    ),
                    Expanded(
                      flex: model.giftStat.toInt(),
                      child: Ink(
                        color: model.currentTheme.mainColor,
                        height: 40,
                        child: model.giftStat != 0
                            ? Icon(
                                AppIcons.gift,
                                color: model.currentTheme.secondColor,
                              )
                            : null,
                      ),
                    ),
                    Expanded(
                      flex: model.beachStat.toInt(),
                      child: Ink(
                        color: model.currentTheme.secondColor,
                        height: 40,
                        child: model.beachStat != 0
                            ? Icon(
                                AppIcons.beach,
                                color: model.currentTheme.mainColor,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
    );
  }
}
