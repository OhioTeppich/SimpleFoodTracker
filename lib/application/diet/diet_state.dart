part of 'diet_bloc.dart';

class DietState extends Equatable {
  final double consumedCarbs;
  final double consumedFat;
  final double consumedProtein;
  final double consumedKcal;
  final double totalKcal;

  const DietState({
    required this.consumedCarbs,
    required this.consumedFat,
    required this.consumedKcal,
    required this.consumedProtein,
    required this.totalKcal,
  });

  factory DietState.initial() {
    return const DietState(
      consumedCarbs: 0.0,
      consumedFat: 0.0,
      consumedKcal: 0.0,
      consumedProtein: 0.0,
      totalKcal: 0.0,
    );
  }

  DietState copyWith({
    double? consumedCarbs,
    double? consumedFat,
    double? consumedKcal,
    double? consumedProtein,
    double? totalKcal,
  }) {
    return DietState(
      consumedCarbs: consumedCarbs ?? this.consumedCarbs,
      consumedFat: consumedFat ?? this.consumedFat,
      consumedKcal: consumedKcal ?? this.consumedKcal,
      consumedProtein: consumedProtein ?? this.consumedProtein,
      totalKcal: totalKcal ?? this.totalKcal,
    );
  }

  @override
  List<Object> get props => [
        consumedCarbs,
        consumedFat,
        consumedKcal,
        consumedProtein,
        totalKcal,
      ];
}
