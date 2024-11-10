import 'package:equatable/equatable.dart';
import 'package:simple_food_tracker/domain/core/entity.dart';

class UserData extends Equatable with Entity {
  final String name;
  final double weight;
  final double palValue;
  // Gender 1 == Male
  // Gender 2 == Female
  final int gender;
  final int height;
  final int age;
  final int athleticActivity;

  const UserData(
      {required this.name,
      required this.weight,
      required this.palValue,
      required this.gender,
      required this.height,
      required this.age,
      required this.athleticActivity});

  UserData copyWith({
    String? name,
    double? weight,
    double? palValue,
    int? gender,
    int? height,
    int? age,
    int? athleticActivity,
  }) {
    return UserData(
      name: name ?? this.name,
      weight: weight ?? this.weight,
      palValue: palValue ?? this.palValue,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      age: age ?? this.age,
      athleticActivity: athleticActivity ?? this.athleticActivity,
    );
  }

  factory UserData.empty() {
    return const UserData(
      name: '',
      weight: 0,
      palValue: 0,
      gender: 0,
      height: 0,
      age: 0,
      athleticActivity: 0,
    );
  }

  @override
  List<Object?> get props => [
        name,
        weight,
        palValue,
        gender,
        height,
        age,
        athleticActivity,
      ];
}
