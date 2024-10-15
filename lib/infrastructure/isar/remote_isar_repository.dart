import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:simple_food_tracker/domain/meal/meal.dart';
import 'package:simple_food_tracker/infrastructure/isar/isar_repository.dart';

class RemoteIsarRepository<T> extends IsarRepository {
  RemoteIsarRepository();

  late final isar = init();

  @visibleForTesting
  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        MealSchema,
        FoodSchema,
      ],
      directory: dir.path,
    );
  }

  @override
  Future<void> delete(Id id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> create(data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future read(Id id) {
    // TODO: implement read
    throw UnimplementedError();
  }
}
