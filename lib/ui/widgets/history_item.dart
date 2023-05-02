import 'package:flutter/material.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/theme/app_icons.dart';
import 'package:text_rpg_two/ui/widgets/show_alert.dart';
import 'package:text_rpg_two/ui/widgets/show_alert_remove.dart';

class HistoryItem extends StatelessWidget {
  final int index;
  final AppProvider model;
  const HistoryItem({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentDouble = model.sortedData[index].balance;
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(
        model.sortedData[index].isCash == true
            ? Icons.money_rounded
            : Icons.credit_card_rounded,
        color: model.currentTheme.mainColor,
      ),
      title: Text(
        currentDouble.toString().replaceAll('.0', ''),
        style: TextStyle(color: 0 <= currentDouble ? Colors.black : Colors.red),
      ),
      subtitle: Text(
        '${model.sortedData[index].time.hour} : ${model.sortedData[index].time.minute}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            AppIcons.appIcons[model.sortedData[index].icon],
            color: model.currentTheme.mainColor,
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => ShowAlert(index: index));
            },
            icon: const Icon(Icons.edit_rounded),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ShowAlertRemove(
                  index: index,
                ),
              );
            },
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
    );
  }
}