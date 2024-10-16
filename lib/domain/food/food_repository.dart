import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:uuid/uuid.dart';

abstract class FoodRepository {
  Future<void> addFood(Food food);
  Future<Food> getFood(Uuid id);
}
