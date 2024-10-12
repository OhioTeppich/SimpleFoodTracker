import 'package:flutter/material.dart';
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

  void saveUserData(UserData userData) {
    _sharedPreferences.setString(userNameKey, userData.name);
    _sharedPreferences.setDouble(userWeightKey, userData.weight);
    _sharedPreferences.setDouble(userPalValueKey, userData.palValue);
    _sharedPreferences.setInt(userGenderKey, userData.gender);
    _sharedPreferences.setInt(userHeightKey, userData.height);
    _sharedPreferences.setInt(userAge, userData.age);
  }

  UserData loadUserData() {
    return UserData(
      name: _sharedPreferences.getString(userNameKey) ?? '',
      weight: _sharedPreferences.getDouble(userWeightKey) ?? 0,
      palValue: _sharedPreferences.getDouble(userPalValueKey) ?? 0,
      gender: _sharedPreferences.getInt(userGenderKey) ?? 0,
      height: _sharedPreferences.getInt(userHeightKey) ?? 0,
      age: _sharedPreferences.getInt(userAge) ?? 0,
    );
  }

//TODO: Wrong place => here only load and save data for SharedPref
  @visibleForTesting
  double getBasalMetabolicRate() {
    UserData userData = loadUserData();
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

  double getPowerMetabolicRate() {
    UserData userData = loadUserData();
    double basalMetabolicRate = getBasalMetabolicRate();

    return basalMetabolicRate * userData.palValue;
  }
}
