import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_food_tracker/domain/userdata/user_data.dart';
import 'package:simple_food_tracker/infrastructure/userdata/user_data_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late UserDataRepository userInfoRepository;
  late SharedPreferences mockSharedPreferences;
  late UserData userData;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();

    userInfoRepository = UserDataRepository(
      sharedPreferences: mockSharedPreferences,
    );

    userData = const UserData(
      name: 'Christian',
      weight: 91.0,
      palValue: 2.4,
      gender: 1,
      height: 184,
      age: 26,
    );

    when(() => mockSharedPreferences.setString(any(), any()))
        .thenAnswer((_) async => Future.value(true));
    when(() => mockSharedPreferences.setDouble(any(), any()))
        .thenAnswer((_) async => Future.value(true));
    when(() => mockSharedPreferences.setInt(any(), any()))
        .thenAnswer((_) async => Future.value(true));

    when(() => mockSharedPreferences.getString(UserDataRepository.userNameKey))
        .thenAnswer((_) => userData.name);
    when(() =>
            mockSharedPreferences.getDouble(UserDataRepository.userWeightKey))
        .thenAnswer((_) => userData.weight);
    when(() => mockSharedPreferences.getInt(UserDataRepository.userAge))
        .thenAnswer((_) => userData.age);
    when(() => mockSharedPreferences.getInt(UserDataRepository.userGenderKey))
        .thenAnswer((_) => userData.gender);
    when(() => mockSharedPreferences.getInt(UserDataRepository.userHeightKey))
        .thenAnswer((_) => userData.height);
    when(() =>
            mockSharedPreferences.getDouble(UserDataRepository.userPalValueKey))
        .thenAnswer((_) => userData.palValue);
  });

  group('saveUserData', () {
    test('shoul save all UserData', () {
      userInfoRepository.saveUserData(userData);
    });
  });
  group('loadUserData', () {
    test('should return all Data from User', () {
      var actual = userInfoRepository.loadUserData();

      expect(actual, userData);
    });
  });
  group('getBasalMetabolicRate', () {
    test('should return correct calculate BasalMetabolicRate', () {
      var actual = userInfoRepository.getBasalMetabolicRate();

      expect(
          actual,
          (10 * userData.weight) +
              (6.25 * userData.height) -
              (5 * userData.age) +
              5);
    });
  });
  group('getPowerMetabolicRate', () {
    test('should return correct calculated PowerMetabolicRate', () {
      var basalMetabolicRate = userInfoRepository.getBasalMetabolicRate();
      var actual = userInfoRepository.getPowerMetabolicRate();

      expect(actual, basalMetabolicRate * userData.palValue);
    });
  });
}
