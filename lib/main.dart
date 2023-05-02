import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:text_rpg_two/domain/hive/data_item_type.dart';
import 'package:text_rpg_two/domain/hive/hive_keys.dart';
import 'package:text_rpg_two/ui/app.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(DataItemTypeAdapter());
  await Hive.openBox<DataItemType>(HiveKeys.dataItemTypeKey);
  runApp(const App());
}