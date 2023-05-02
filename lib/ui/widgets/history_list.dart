import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_rpg_two/domain/provider/app_provider.dart';
import 'package:text_rpg_two/ui/widgets/history_item.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HistoryItem(
            model: model,
            index: index,
          );
        },
        childCount: model.sortedData.length,
      ),
    );
  }
}