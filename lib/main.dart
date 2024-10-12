import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_food_tracker/application/onboarding/on_boarding_cubit.dart';
import 'package:simple_food_tracker/domain/userdata/user_data.dart';
import 'package:simple_food_tracker/presentation/pages/home/home_page.dart';
import 'package:simple_food_tracker/presentation/pages/onboarding/on_boarding_page.dart';
import 'injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ic.init();

  runApp(BlocProvider(
    create: (context) => ic.ic.get<OnBoardingCubit>(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => OnBoardingPage(),
        '/home': (context) => const HomePage(),
      },
      initialRoute:
          context.read<OnBoardingCubit>().loadUserData() == UserData.empty()
              ? '/'
              : '/home',
    );
  }
}
