import 'dart:convert';

import 'package:simple_food_tracker/domain/db/db_repository.dart';
import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:simple_food_tracker/domain/food/food_repository.dart';
import 'package:uuid/uuid.dart';

class RemoteFoodRepository extends FoodRepository {
  final DbRepository _remoteDbRepository;

  RemoteFoodRepository({
    required DbRepository remoteDbRepository,
  }) : _remoteDbRepository = remoteDbRepository;

  static const String fileName = 'food.json';

  @override
  Future<void> addFood(Food food) async {
    await _remoteDbRepository.create(food.toJson().toString(), fileName);
  }

  @override
  Future<Food> getFoodById(Uuid id) async {
    var file = await _remoteDbRepository.read(fileName);

    var files = file.split(';');

    var jsonList = files.map((mapString) {
      return jsonDecode(mapString) as Map<String, dynamic>;
    }).toList();

    for (var json in jsonList) {
      var food = Food.fromJson(json);
      if (food.id == id) {
        return food;
      }
    }

    //TODO: throw error
    return Food(id: id, name: 'name', kcal: 1, protein: 1, fat: 1);
  }

  @override
  Future<void> deleteFood(Uuid id) async {
    // var food = await getFoodById(id);
    // await _remoteDbRepository.delete(food.toJson().toString(), fileName);
  }
}
