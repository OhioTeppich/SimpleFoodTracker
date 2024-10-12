part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  final UserData userData;

  const OnBoardingState({
    required this.userData,
  });

  factory OnBoardingState.initial() {
    return OnBoardingState(
      userData: UserData.empty(),
    );
  }

  OnBoardingState copyWith({
    UserData? userData,
  }) {
    return OnBoardingState(userData: userData ?? this.userData);
  }

  @override
  List<Object> get props => [userData];
}
