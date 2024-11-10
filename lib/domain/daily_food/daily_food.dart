import 'package:equatable/equatable.dart';
import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:uuid/uuid.dart';

class DailyFood extends Equatable implements Entity {
  @override
  final Uuid id;

  final List<Uuid> foodIds;
  final List<Uuid> mealIds;
  final DateTime date;

  const DailyFood({
    required this.id,
    required this.foodIds,
    required this.mealIds,
    required this.date,
  });

  DailyFood copyWith({
    Uuid? id,
    List<Uuid>? foodIds,
    List<Uuid>? mealIds,
    DateTime? date,
  }) {
    return DailyFood(
      id: id ?? this.id,
      foodIds: foodIds ?? this.foodIds,
      mealIds: mealIds ?? this.mealIds,
      date: date ?? this.date,
    );
  }

  static DailyFood fromJson(Map<String, dynamic> json) => DailyFood(
        id: json['id'],
        foodIds: json['foodIds'],
        mealIds: json['mealIds'],
        date: json['date'],
      );

  Map<String, dynamic> toJson(DailyFood dailyFood) => {
        'id': dailyFood.id,
        'foodIds': dailyFood.foodIds,
        'mealIds': dailyFood.mealIds,
        'date': dailyFood.date,
      };

  factory DailyFood.fromEntity(DailyFood dailyFood) {
    return DailyFood(
      id: dailyFood.id,
      foodIds: dailyFood.foodIds,
      mealIds: dailyFood.mealIds,
      date: dailyFood.date,
    );
  }

  @override
  List<Object?> get props => [
        id,
        foodIds,
        mealIds,
        date,
      ];
}
