import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_food_tracker/application/onboarding/on_boarding_cubit.dart';
import 'package:simple_food_tracker/domain/userdata/user_data.dart';
import 'package:simple_food_tracker/infrastructure/userdata/user_data_repository.dart';

class MockUserDataRepository extends Mock implements UserDataRepository {}

void main() {
  late OnBoardingCubit onBoardingCubit;
  late UserDataRepository mockUserDataRepository;

  setUp(() {
    mockUserDataRepository = MockUserDataRepository();

    onBoardingCubit = OnBoardingCubit(
      userDataRepository: mockUserDataRepository,
    );

    when(() => mockUserDataRepository.saveUserData(any())).thenAnswer((_) {});
  });

  setUpAll(() {
    registerFallbackValue(UserData.empty());
  });

  group('saveUserData', () {
    test('should call saveUserData from UserDataRepo', () {
      onBoardingCubit.saveUserData(UserData.empty());

      verify(() => mockUserDataRepository.saveUserData(any())).called(1);
    });
  });
}
