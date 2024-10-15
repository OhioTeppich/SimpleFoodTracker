import 'package:isar/isar.dart';

part 'food.g.dart';

@collection
class Food {
  Id id = Isar.autoIncrement;

  String? name;

  double? kcal;

  double? protein;

  double? fat;
}
