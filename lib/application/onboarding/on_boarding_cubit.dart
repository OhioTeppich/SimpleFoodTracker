import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_food_tracker/domain/userdata/user_data.dart';
import 'package:simple_food_tracker/infrastructure/userdata/user_data_repository.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final UserDataRepository _userDataRepository;

  OnBoardingCubit({
    required UserDataRepository userDataRepository,
  })  : _userDataRepository = userDataRepository,
        super(OnBoardingState.initial());

  void saveUserData(UserData userData) {
    _userDataRepository.saveUserData(userData);
  }

  UserData loadUserData() {
    return _userDataRepository.loadUserData();
  }
}
