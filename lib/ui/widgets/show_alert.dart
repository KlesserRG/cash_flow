import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/hive/data_item_type.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/theme/app_icons.dart';
import 'package:text_rpg_two/ui/widgets/icon_btn.dart';

class ShowAlert extends StatefulWidget {
  final int index;
  const ShowAlert({
    super.key,
    this.index = -1,
  });

  @override
  State<ShowAlert> createState() => _ShowAlertState();
}

class _ShowAlertState extends State<ShowAlert> {
  double date = 0;
  String currentIcon = AppIcons.homeIcon;
  bool isCash = false;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: Text(widget.index == -1 ? 'Add new Item' : 'Edit current Item'),
      content: TextField(
        decoration: InputDecoration(
          hintText: 'Your date',
          helperText: error == true ? 'Not correct date' : null,
          helperStyle: const TextStyle(color: Colors.red),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: model.currentTheme.mainColor,
            ),
          ),
        ),
        cursorColor: model.currentTheme.mainColor,
        keyboardType: TextInputType.number,
        onChanged: (data) {
          try {
            date = double.parse(data);
            error = false;
          } catch (e) {
            error = true;
          }
          setState(() {});
        },
      ),
      actions: [
        Column(
          children: [
            Row(
              children: [
                IconBTN(
                  action: () => setState(() {
                    currentIcon = AppIcons.homeIcon;
                  }),
                  icon: AppIcons.home,
                  isActive: AppIcons.appIcons[currentIcon] == AppIcons.home,
                  activeColor: model.currentTheme.mainColor,
                ),
                IconBTN(
                  action: () => setState(() {
                    currentIcon = AppIcons.shopIcon;
                  }),
                  icon: AppIcons.shop,
                  isActive: AppIcons.appIcons[currentIcon] == AppIcons.shop,
                  activeColor: model.currentTheme.mainColor,
                ),
                IconBTN(
                  action: () => setState(() {
                    currentIcon = AppIcons.carIcon;
                  }),
                  icon: AppIcons.car,
                  isActive: AppIcons.appIcons[currentIcon] == AppIcons.car,
                  activeColor: model.currentTheme.mainColor,
                ),
                const Spacer(),
                IconBTN(
                  action: () => setState(() {
                    isCash = !isCash;
                  }),
                  icon: isCash == false
                      ? Icons.credit_card_rounded
                      : Icons.money_rounded,
                  isActive: true,
                  activeColor: model.currentTheme.mainColor,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                IconBTN(
                  action: () => setState(() {
                    currentIcon = AppIcons.webIcon;
                  }),
                  icon: AppIcons.web,
                  isActive: AppIcons.appIcons[currentIcon] == AppIcons.web,
                  activeColor: model.currentTheme.mainColor,
                ),
                IconBTN(
                  action: () => setState(() {
                    currentIcon = AppIcons.giftIcon;
                  }),
                  icon: AppIcons.gift,
                  isActive: AppIcons.appIcons[currentIcon] == AppIcons.gift,
                  activeColor: model.currentTheme.mainColor,
                ),
                IconBTN(
                  action: () => setState(() {
                    currentIcon = AppIcons.beachIcon;
                  }),
                  icon: AppIcons.beach,
                  isActive: AppIcons.appIcons[currentIcon] == AppIcons.beach,
                  activeColor: model.currentTheme.mainColor,
                ),
                const Spacer(),
                IconBTN(
                  action: error == true
                      ? () {}
                      : () {
                          model.insertData(
                              DataItemType(
                                time: widget.index == -1
                                    ? DateTime.now()
                                    : model.data[widget.index].time,
                                icon: currentIcon,
                                balance: date,
                                isCash: isCash,
                              ),
                              widget.index);
                          Navigator.pop(context);
                        },
                  icon: Icons.done_rounded,
                  activeColor: model.currentTheme.mainColor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
