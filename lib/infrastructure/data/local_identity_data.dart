import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:simple_food_tracker/domain/daily_food/daily_food.dart';
import 'package:simple_food_tracker/domain/datasource/datasource.dart';
import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:simple_food_tracker/domain/meal/meal.dart';
import 'package:simple_food_tracker/domain/repositories/data_repository.dart';

abstract class LocalEntityData<T extends Entity> extends Data<T> {
  final Datasource<T> _datasource;

  LocalEntityData({
    required Datasource<T> datasource,
  }) : _datasource = datasource;

  @override
  Future<void> add(T data) async {
    if ((await _datasource.read(data.id)) != null) {
      throw EntityAlreadyExistsException();
    } else {
      await _datasource.write(data);
    }
  }

  @override
  Future<T> get(String id) async {
    var result = await _datasource.read(id);
    if (result == null) {
      throw EntityNotFoundException();
    } else {
      return result;
    }
  }

  @override
  Future<List<T>> gets() async {
    return await _datasource.readAll();
  }
}

class LocalMealData extends LocalEntityData<Meal> implements MealData {
  LocalMealData({
    required super.datasource,
  });
}

class LocalFoodData extends LocalEntityData<Food> implements FoodData {
  LocalFoodData({
    required super.datasource,
  });
}

class LocalDailyFoodData extends LocalEntityData<DailyFood>
    implements DailyFoodData {
  LocalDailyFoodData({
    required super.datasource,
  });
}
