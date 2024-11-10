import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_meal_event.dart';
part 'add_meal_state.dart';

class AddMealBloc extends Bloc<AddMealEvent, AddMealState> {
  AddMealBloc() : super(AddMealState.initial()) {
    on<AddMealEvent>((event, emit) {});
    on<ChangeSelectedMealEvent>(_onChangeSelectedMealEvent);
  }

  void _onChangeSelectedMealEvent(
    ChangeSelectedMealEvent event,
    Emitter<AddMealState> emit,
  ) {
    emit(state.copyWith(selectedMealIndex: event.newIndex));
  }
}
