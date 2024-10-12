import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_food_tracker/user_info_repository.dart';

final ic = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  ic.registerLazySingleton(() => sharedPreferences);

  ic.registerLazySingleton(
      () => UserInfoRepository(sharedPreferences: ic.get<SharedPreferences>()));
}
