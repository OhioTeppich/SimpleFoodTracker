import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Food extends Equatable {
  final Uuid id;
  final String name;
  final double kcal;
  final double protein;
  final double fat;

  const Food({
    required this.id,
    required this.name,
    required this.kcal,
    required this.fat,
    required this.protein,
  });

  Food copyWith({
    Uuid? id,
    String? name,
    double? kcal,
    double? fat,
    double? protein,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      kcal: kcal ?? this.kcal,
      fat: fat ?? this.fat,
      protein: protein ?? this.protein,
    );
  }

  @override
  List<Object?> get props => [
        id,
        fat,
        kcal,
        name,
        protein,
      ];
}
