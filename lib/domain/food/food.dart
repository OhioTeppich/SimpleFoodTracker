import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:uuid/uuid.dart';

class Food implements Entity {
  @override
  final Uuid id;

  final String name;
  final double kcal;
  final double protein;
  final double fat;

  Food({
    required this.id,
    required this.name,
    required this.kcal,
    required this.protein,
    required this.fat,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'kcal': kcal,
        'protein': protein,
        'fat': fat,
      };

  static Food fromJson(Map<String, dynamic> json) => Food(
        id: json['id'],
        name: json['name'],
        kcal: json['kcal'],
        protein: json['protein'],
        fat: json['fat'],
      );
}
