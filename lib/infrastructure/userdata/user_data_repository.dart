import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_food_tracker/domain/userdata/user_data.dart';

class UserDataRepository {
  final SharedPreferences _sharedPreferences;

  UserDataRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  static const String userNameKey = 'user-name';
  static const String userWeightKey = 'user-weight';
  static const String userPalValueKey = 'user-pal-value';
  static const String userGenderKey = 'user-gender';
  static const String userHeightKey = 'user-height';
  static const String userAge = 'user-age';
  static const String athleticActivity = 'athletic-activity';

  void saveUserData(UserData userData) {
    _sharedPreferences.setString(userNameKey, userData.name);
    _sharedPreferences.setDouble(userWeightKey, userData.weight);
    _sharedPreferences.setDouble(userPalValueKey, userData.palValue);
    _sharedPreferences.setInt(userGenderKey, userData.gender);
    _sharedPreferences.setInt(userHeightKey, userData.height);
    _sharedPreferences.setInt(userAge, userData.age);
    _sharedPreferences.setInt(athleticActivity, userData.athleticActivity);
  }

  UserData loadUserData() {
    return UserData(
      name: _sharedPreferences.getString(userNameKey) ?? '',
      weight: _sharedPreferences.getDouble(userWeightKey) ?? 0,
      palValue: _sharedPreferences.getDouble(userPalValueKey) ?? 0,
      gender: _sharedPreferences.getInt(userGenderKey) ?? 0,
      height: _sharedPreferences.getInt(userHeightKey) ?? 0,
      age: _sharedPreferences.getInt(userAge) ?? 0,
      athleticActivity: _sharedPreferences.getInt(athleticActivity) ?? 0,
    );
  }
}
