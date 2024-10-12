import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_food_tracker/user_data.dart';
import 'package:simple_food_tracker/user_info_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late UserInfoRepository userInfoRepository;
  late SharedPreferences mockSharedPreferences;
  late UserData userData;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();

    userInfoRepository = UserInfoRepository(
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
  });

  group('saveUserData', () {
    test('shoul save all UserData', () {
      userInfoRepository.saveUserData(userData);
    });
  });
  group('loadUserData', () {
    test('should return all Data from User', () {
      when(() =>
              mockSharedPreferences.getString(UserInfoRepository.userNameKey))
          .thenAnswer((_) => userData.name);
      when(() =>
              mockSharedPreferences.getDouble(UserInfoRepository.userWeightKey))
          .thenAnswer((_) => userData.weight);

      var actual = userInfoRepository.loadUserData();

      expect(actual, userData);
    });
  });
}
