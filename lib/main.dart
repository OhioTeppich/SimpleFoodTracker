import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_food_tracker/application/addmeal/add_meal_bloc.dart';
import 'package:simple_food_tracker/application/diet/diet_bloc.dart';
import 'package:simple_food_tracker/application/onboarding/on_boarding_cubit.dart';
import 'package:simple_food_tracker/presentation/pages/add_meal_page.dart';
import 'package:simple_food_tracker/presentation/pages/diet/diet_page.dart';
import 'package:simple_food_tracker/presentation/pages/home/home_page.dart';
import 'package:simple_food_tracker/presentation/pages/mealType/meal_type_page.dart';
import 'package:simple_food_tracker/presentation/pages/onboarding/on_boarding_page.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init of InjectionContainer
  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ic.get<OnBoardingCubit>(),
        ),
        BlocProvider(
          create: (context) => ic.get<DietBloc>(),
        ),
        BlocProvider(
          create: (context) => ic.get<AddMealBloc>(),
        )
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => OnBoardingPage(),
        '/home': (context) => const HomePage(),
        '/diet': (context) => const DietPage(),
        '/mealtype': (context) => const MealTypePage(),
        '/addmeal': (context) => const AddMealPage(),
      },
      initialRoute:
          false //context.read<OnBoardingCubit>().loadUserData() == UserData.empty()
              ? '/'
              : '/home',
    );
  }
}
