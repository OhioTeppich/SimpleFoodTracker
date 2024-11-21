import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_food_tracker/application/addmeal/add_meal_bloc.dart';
import 'package:simple_food_tracker/application/diet/diet_bloc.dart';
import 'package:simple_food_tracker/application/onboarding/on_boarding_cubit.dart';
import 'package:simple_food_tracker/domain/datasource/datasource.dart';
import 'package:simple_food_tracker/domain/repositories/data_repository.dart';
import 'package:simple_food_tracker/infrastructure/datasource/json_datasource.dart';
import 'package:simple_food_tracker/infrastructure/data/local_identity_data.dart';
import 'package:simple_food_tracker/infrastructure/userdata/user_data_repository.dart';

final ic = GetIt.instance;

Future<void> init() async {
  bloc();

  datasource();

  repositories();

  await sharedPreferences();
}

void bloc() {
  ic.registerLazySingleton<OnBoardingCubit>(
      () => OnBoardingCubit(userDataRepository: ic.get<UserDataRepository>()));

  ic.registerLazySingleton<DietBloc>(() => DietBloc(
        userDataRepository: ic.get<UserDataRepository>(),
        dailyFoodDatasource: ic.get<DailyFoodDatasoruce>(),
      ));

  ic.registerLazySingleton<AddMealBloc>(
      () => AddMealBloc(dailyFoodData: ic.get<DailyFoodData>()));
}

void datasource() {
  ic.registerLazySingleton<FoodDatasource>(() => FoodJsonDatasource());

  ic.registerLazySingleton<MealDatasrouce>(() => MealJsonDatasoruce());

  ic.registerLazySingleton<DailyFoodDatasoruce>(
      () => DailyFoodJsonDatasource());
}

Future<void> sharedPreferences() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  ic.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  ic.registerLazySingleton<UserDataRepository>(
      () => UserDataRepository(sharedPreferences: ic.get<SharedPreferences>()));
}

void repositories() {
  // MIT max abklären:
  // ich habe jetzt drei verscheidene "repos"
  // mit einem welche für alle drei da ist währe es besser?
  // oder ein useCase erstellen welche guckt welche von den Dreien benutzt wird
  ic.registerLazySingleton<DailyFoodData>(
      () => LocalDailyFoodData(datasource: ic.get<DailyFoodDatasoruce>()));
  ic.registerLazySingleton<FoodData>(
      () => LocalFoodData(datasource: ic.get<FoodDatasource>()));
  ic.registerLazySingleton<MealData>(
      () => LocalMealData(datasource: ic.get<MealDatasrouce>()));
}
