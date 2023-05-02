// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_item_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataItemTypeAdapter extends TypeAdapter<DataItemType> {
  @override
  final int typeId = 0;

  @override
  DataItemType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataItemType(
      balance: fields[0] as double,
      time: fields[1] as DateTime,
      icon: fields[2] as String,
      isCash: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DataItemType obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.balance)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.isCash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
