// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'associate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssociateAdapter extends TypeAdapter<Associate> {
  @override
  final typeId = 0;

  @override
  Associate read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Associate(
      name: fields[0] as String,
      phone: fields[1] as int,
      isSenior: fields[2] as bool,
      age: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Associate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.isSenior)
      ..writeByte(3)
      ..write(obj.age);
  }
}
