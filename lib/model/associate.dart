// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:hive/hive.dart';

part 'associate.g.dart';

@HiveType(typeId: 0)
class Associate extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int phone;

  @HiveField(2)
  final bool isSenior;

  // @HiveField(3)
  // final DateTime joinDate;

  @HiveField(3)
  final int age;

  var x = DateTime.parse('1969-07-20 20:18:04Z');

  Associate({
    required this.name,
    this.phone = 123,
    this.isSenior = false,
    this.age = 27
  });

  Map toJson() => {
    'name': name,
    'phone': phone,
    'isSenior': isSenior,
    'age': age,
  };
}
