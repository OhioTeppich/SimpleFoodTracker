import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_food_tracker/domain/core/macros.dart';
import 'package:simple_food_tracker/domain/db/db_repository.dart';
import 'package:simple_food_tracker/domain/userdata/user_data.dart';
import 'package:simple_food_tracker/infrastructure/userdata/user_data_repository.dart';

part 'diet_event.dart';
part 'diet_state.dart';

class DietBloc extends Bloc<DietEvent, DietState> {
  final UserDataRepository _userDataRepository;
  final DailyFoodDatasoruce _dailyFoodDatasource;

  DietBloc({
    required UserDataRepository userDataRepository,
    required DailyFoodDatasoruce dailyFoodDatasource,
  })  : _dailyFoodDatasource = dailyFoodDatasource,
        _userDataRepository = userDataRepository,
        super(
          DietState.initial(),
        ) {
    on<DietEvent>((event, emit) {});
  }

  @visibleForTesting
  double calcBasalMetabolicRate() {
    UserData userData = _userDataRepository.loadUserData();
    //Man
    if (userData.gender == 1) {
      return (10 * userData.weight) +
          (6.25 * userData.height) -
          (5 * userData.age) +
          5;
// Woman
    } else if (userData.gender == 2) {
      return (10 * userData.weight) +
          (6.25 * userData.height) -
          (5 * userData.age) -
          161;
    }
    return 0;
  }

  @visibleForTesting
  double calcPowerMetabolicRate() {
    UserData userData = _userDataRepository.loadUserData();
    double basalMetabolicRate = calcBasalMetabolicRate();

    return basalMetabolicRate * userData.palValue;
  }

  Map<Macros, double> calcMaxMacros() {
    UserData userData = _userDataRepository.loadUserData();
    Map<Macros, double> macros = {
      Macros.carbs: 0,
      Macros.fat: 0,
      Macros.protein: 0,
    };

    switch (userData.athleticActivity) {
      case 0:
        macros[Macros.protein] = 1.8 * userData.weight;
        macros[Macros.fat] = 0.5 * userData.weight;
        break;
      case 1:
        macros[Macros.protein] = 2.0 * userData.weight;
        macros[Macros.fat] = 0.7 * userData.weight;
        break;
      case 2:
        macros[Macros.protein] = 2.2 * userData.weight;
        macros[Macros.fat] = 1.0 * userData.weight;
        break;
      default:
        break;
    }

    var proteinInKcal = macros[Macros.protein]! * 4.1;
    var fatInKcal = macros[Macros.fat]! * 9.3;
    macros[Macros.carbs] =
        (calcPowerMetabolicRate() - proteinInKcal - fatInKcal) / 4.1;

    return macros;
  }
}
