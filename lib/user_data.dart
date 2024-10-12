import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String name;
  final double weight;
  final double palValue;
  final int gender;
  final int height;
  final int age;

  const UserData({
    required this.name,
    required this.weight,
    required this.palValue,
    required this.gender,
    required this.height,
    required this.age,
  });

  @override
  List<Object?> get props => [
        name,
        weight,
        palValue,
        gender,
        height,
        age,
      ];
}
