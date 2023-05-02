import 'package:hive/hive.dart';
import 'package:text_rpg_two/domain/hive/data_item_type.dart';
import 'package:text_rpg_two/domain/hive/hive_keys.dart';

class HiveBoxes{
  static Box<DataItemType> dataItemType = Hive.box<DataItemType>(HiveKeys.dataItemTypeKey);
}