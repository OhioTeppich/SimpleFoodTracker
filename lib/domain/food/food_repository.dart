import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:uuid/uuid.dart';

abstract class FoodRepository {
  Future<void> addFood(Food food);
  Future<Food> getFoodById(Uuid id);
  Future<void> deleteFood(Uuid id);
}
