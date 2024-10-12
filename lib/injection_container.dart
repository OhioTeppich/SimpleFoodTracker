import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_food_tracker/application/onboarding/on_boarding_cubit.dart';
import 'package:simple_food_tracker/infrastructure/userdata/user_data_repository.dart';

final ic = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  ic.registerLazySingleton(() => sharedPreferences);

  ic.registerLazySingleton(
      () => UserDataRepository(sharedPreferences: ic.get<SharedPreferences>()));

  ic.registerLazySingleton(
      () => OnBoardingCubit(userDataRepository: ic.get<UserDataRepository>()));
}
