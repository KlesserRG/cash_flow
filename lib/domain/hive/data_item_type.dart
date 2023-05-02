import 'package:hive/hive.dart';

part 'data_item_type.g.dart';

@HiveType(typeId: 0)
class DataItemType{

  @HiveField(0)
  double balance;

  @HiveField(1)
  DateTime time;

  @HiveField(2)
  String icon;

  @HiveField(3)
  bool isCash;
  
  DataItemType({
    required this.balance,
    required this.time,
    required this.icon,
    required this.isCash,
  });
}