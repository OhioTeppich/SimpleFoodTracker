import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_food_tracker/application/addmeal/add_meal_bloc.dart';

void main() {
  late AddMealBloc addMealBloc;

  setUp(() {
    addMealBloc = AddMealBloc();
  });

  group('AddMealBloc', () {
    group('ChangeSelectedMealEvent', () {
      blocTest(
        'should emit new given index',
        build: () => addMealBloc,
        act: (bloc) => bloc.add(const ChangeSelectedMealEvent(newIndex: 1)),
        expect: () => [
          isA<AddMealState>().having(
              (state) => state.selectedMealIndex, 'selectedMealIndex', 1),
        ],
      );
    });
  });
}
