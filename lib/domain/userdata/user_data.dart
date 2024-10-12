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

  UserData copyWith({
    String? name,
    double? weight,
    double? palValue,
    int? gender,
    int? height,
    int? age,
  }) {
    return UserData(
      name: name ?? this.name,
      weight: weight ?? this.weight,
      palValue: palValue ?? this.palValue,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      age: age ?? this.age,
    );
  }

  static UserData empty() {
    return const UserData(
      name: '',
      weight: 0,
      palValue: 0,
      gender: 0,
      height: 0,
      age: 0,
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
      ];
}
