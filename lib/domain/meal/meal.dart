import 'package:equatable/equatable.dart';
import 'package:simple_food_tracker/domain/core/entity.dart';

class Meal extends Equatable with Entity {
  @override
  final String id;

  final String name;
  final List<String> foodIds;

  const Meal({
    required this.id,
    required this.name,
    required this.foodIds,
  });

  Map<String, dynamic> toJson(Meal food) => {
        'id': food.id,
        'name': food.name,
        'foodIds': food.foodIds,
      };

  static Meal fromJson(Map<String, dynamic> json) => Meal(
        id: json['id'],
        name: json['name'],
        foodIds: [...json['foodIds']],
      );

  factory Meal.fromEntity(Meal meal) {
    return Meal(
      id: meal.id,
      name: meal.name,
      foodIds: meal.foodIds,
    );
  }

  @override
  List<Object?> get props => [
        id,
        foodIds,
      ];
}
