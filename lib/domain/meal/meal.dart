import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Meal extends Equatable {
  final Uuid id;
  final List<Uuid> foodIds;

  const Meal({
    required this.id,
    required this.foodIds,
  });

  Meal copyWith({
    Uuid? id,
    List<Uuid>? foodIds,
  }) {
    return Meal(
      id: id ?? this.id,
      foodIds: foodIds ?? this.foodIds,
    );
  }

  @override
  List<Object?> get props => [
        id,
        foodIds,
      ];
}
