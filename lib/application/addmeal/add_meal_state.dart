part of 'add_meal_bloc.dart';

class AddMealState extends Equatable {
  final List<String> mealNames;
  final int selectedMealIndex;
  final double currentCarbs;
  final double currentFat;
  final double currentProtein;
  final double currentKcal;

  const AddMealState({
    required this.mealNames,
    required this.selectedMealIndex,
    required this.currentCarbs,
    required this.currentFat,
    required this.currentKcal,
    required this.currentProtein,
  });

  factory AddMealState.initial() {
    return const AddMealState(
      mealNames: ['Früchte', 'Obst'],
      selectedMealIndex: 0,
      currentCarbs: 0.0,
      currentFat: 0.0,
      currentKcal: 0.0,
      currentProtein: 0.0,
    );
  }

  AddMealState copyWith({
    List<String>? mealNames,
    int? selectedMealIndex,
    double? currentCarbs,
    double? currentFat,
    double? currentProtein,
    double? currentKcal,
  }) {
    return AddMealState(
      mealNames: mealNames ?? this.mealNames,
      selectedMealIndex: selectedMealIndex ?? this.selectedMealIndex,
      currentCarbs: currentCarbs ?? this.currentCarbs,
      currentFat: currentFat ?? this.currentFat,
      currentKcal: currentKcal ?? this.currentKcal,
      currentProtein: currentProtein ?? this.currentProtein,
    );
  }

  @override
  List<Object> get props => [
        mealNames,
        selectedMealIndex,
        currentCarbs,
        currentFat,
        currentKcal,
        currentProtein,
      ];
}
