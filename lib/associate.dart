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

  @HiveField(3)
  final int age;

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
