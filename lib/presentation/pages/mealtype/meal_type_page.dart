import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_food_tracker/presentation/core/date_picker.dart';
import 'package:simple_food_tracker/presentation/core/meal_type_box.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

class MealTypePage extends StatelessWidget {
  const MealTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SimpleFoodTrackerColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add Meals'),
      ),
      body: Column(
        children: [
          const DatePicker(),
          const SizedBox(height: 2.0),
          MealTypeBox(
            image: SvgPicture.asset(
              'assets/images/breakfast.svg',
              alignment: Alignment.bottomRight,
            ),
            text: 'Breakfast',
            imagePosition: ImagePosition.right,
            onTap: () => Navigator.pushNamed(context, '/addmeal',
                arguments: {'title': 'Breakfast'}),
          ),
          MealTypeBox(
            image: SvgPicture.asset(
              'assets/images/lunch.svg',
              alignment: Alignment.bottomLeft,
            ),
            text: 'Lunch',
            imagePosition: ImagePosition.left,
            onTap: () => Navigator.pushNamed(context, '/addmeal',
                arguments: {'title': 'Lunch'}),
            animationDelay: const Duration(milliseconds: 200),
          ),
          MealTypeBox(
            image: SvgPicture.asset(
              'assets/images/snack.svg',
              alignment: Alignment.bottomRight,
            ),
            text: 'Snack',
            imagePosition: ImagePosition.right,
            onTap: () => Navigator.pushNamed(context, '/addmeal',
                arguments: {'title': 'Snack'}),
            animationDelay: const Duration(milliseconds: 400),
          ),
          MealTypeBox(
            image: SvgPicture.asset(
              'assets/images/dinner.svg',
              alignment: Alignment.bottomLeft,
            ),
            text: 'Dinner',
            imagePosition: ImagePosition.left,
            onTap: () => Navigator.pushNamed(context, '/addmeal',
                arguments: {'title': 'Dinner'}),
            animationDelay: const Duration(milliseconds: 600),
          ),
        ]
            .map(
              (element) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: element,
              ),
            )
            .toList(),
      ),
    );
  }
}
