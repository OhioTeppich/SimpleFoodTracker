import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_food_tracker/domain/daily_food/daily_food.dart';
import 'package:simple_food_tracker/domain/repositories/data_repository.dart';

part 'add_meal_event.dart';
part 'add_meal_state.dart';

class AddMealBloc extends Bloc<AddMealEvent, AddMealState> {
  final DailyFoodData _dailyFoodData;

  AddMealBloc({
    required DailyFoodData dailyFoodData,
  })  : _dailyFoodData = dailyFoodData,
        super(AddMealState.initial()) {
    on<AddMealEvent>((event, emit) {});
    on<ChangeSelectedMealEvent>(_onChangeSelectedMealEvent);
    on<AddDailyFoodEvent>(_onAddDailyFoodEvent);
  }

  void _onChangeSelectedMealEvent(
    ChangeSelectedMealEvent event,
    Emitter<AddMealState> emit,
  ) {
    emit(state.copyWith(selectedMealIndex: event.newIndex));
  }

  void _onAddDailyFoodEvent(
    AddDailyFoodEvent event,
    Emitter<AddMealState> emit,
  ) async {
    await _dailyFoodData.add(event.data);
  }
}
