import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:simple_food_tracker/domain/daily_food/daily_food.dart';
import 'package:simple_food_tracker/domain/food/food.dart';

import '../meal/meal.dart';

class EntityNotFoundException implements Exception {}

class EntityAlreadyExistsException implements Exception {}

abstract class Data<T extends Entity> {
  Future<void> add(T data);
  Future<T> get(String id);
  Future<List<T>> gets();
  // Future<void> update(T data);
  // Future<void> remove(String id);
}

abstract class MealData extends Data<Meal> {}

abstract class FoodData extends Data<Food> {}

abstract class DailyFoodData extends Data<DailyFood> {}
