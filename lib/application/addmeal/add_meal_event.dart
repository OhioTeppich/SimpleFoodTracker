part of 'add_meal_bloc.dart';

class AddMealEvent extends Equatable {
  const AddMealEvent();

  @override
  List<Object> get props => [];
}

class ChangeSelectedMealEvent extends AddMealEvent {
  final int newIndex;

  const ChangeSelectedMealEvent({
    required this.newIndex,
  });

  @override
  List<Object> get props => [newIndex];
}

class AddDailyFoodEvent<T> extends AddMealEvent {
  final DailyFood data;

  const AddDailyFoodEvent({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
