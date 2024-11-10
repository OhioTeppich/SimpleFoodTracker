import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:simple_food_tracker/domain/daily_food/daily_food.dart';
import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:simple_food_tracker/domain/meal/meal.dart';

abstract class Datasource<T extends Entity> {
  Future<void> write(T data);
  Future<T> read(String id);
  Future<List<T>> readAll();
  Future<void> delete(String data, String fileName);
}

abstract class FoodDatasource extends Datasource<Food> {}

abstract class MealDatasrouce extends Datasource<Meal> {}

abstract class DailyFoodDatasoruce extends Datasource<DailyFood> {}
