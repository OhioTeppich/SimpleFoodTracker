import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:simple_food_tracker/domain/meal/meal.dart';
import 'package:simple_food_tracker/infrastructure/isar/isar_repository.dart';

class RemoteIsarRepository<T> extends IsarRepository {
  RemoteIsarRepository();

  @visibleForTesting
  Future open() async {
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
  Future<void> delete(Id id) async {
    var isar = await open();
    await isar.writeTxn(() async {
      await isar.T.delete(id);
    });
  }

  @override
  Future<void> create(data) async {
    var isar = await open();
    await isar.writeTxn(() async {
      await isar.T.put(data);
    });
  }

  @override
  Future<T> read(Id id) async {
    var isar = await open();
    return await isar.T.get(id);
  }
}
