import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/widgets/icon_btn.dart';

class ShowAlertRemove extends StatelessWidget {
  final int index;
  const ShowAlertRemove({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      title: const Text('Are you sure about it?'),
      actions: [
        IconBTN(
          icon: Icons.close_rounded,
          action: () {
            Navigator.pop(context);
          },
        ),
        IconBTN(
          icon: Icons.done_rounded,
          action: () {
            model.deleteData(index);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
