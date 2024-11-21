import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_food_tracker/application/addmeal/add_meal_bloc.dart';
import 'package:simple_food_tracker/domain/daily_food/daily_food.dart';
import 'package:simple_food_tracker/presentation/core/arrow_button.dart';
import 'package:simple_food_tracker/presentation/core/custom_button.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

import '../core/info_box.dart';
import '../core/serving_chart.dart';

class AddNewMealPage extends StatelessWidget {
  const AddNewMealPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddMealBloc, AddMealState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SimpleFoodTrackerColor.backgroundColor,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: const Text('Add New Meal'),
          ),
          body: Column(
            children: [
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      const SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EditableInfoBox(
                            state: state,
                            backgroundColor:
                                SimpleFoodTrackerColor.clickAbleColor,
                            imagePath: 'assets/images/clock.svg',
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ArrowButton(),
                          InfoBox(
                            state: state,
                            backgroundColor:
                                SimpleFoodTrackerColor.fatProgressColor,
                            imagePath: 'assets/images/bar_chart.svg',
                            text: const Text(
                              'Medium Level',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const ArrowButton(
                            arrowDirection: ArrowDirection.right,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EditableInfoBox(
                            state: state,
                            backgroundColor:
                                SimpleFoodTrackerColor.caloriesProgressColor,
                            imagePath: 'assets/images/flame.svg',
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 14.0,
                        ),
                        child: Text(
                          'Per serving',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServingChart(
                            state: state,
                            chartColor:
                                SimpleFoodTrackerColor.carbProgressColor,
                            title: 'CARBS',
                          ),
                          ServingChart(
                            state: state,
                            chartColor:
                                SimpleFoodTrackerColor.proteinProgressColor,
                            title: 'Protein',
                          ),
                          ServingChart(
                            state: state,
                            chartColor: SimpleFoodTrackerColor.fatProgressColor,
                            title: 'Fat',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        child: CustomButton(
                          text: const Center(
                            child: Text(
                              '+ Add New Meal',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          width: double.infinity,
                          onTap: () =>
                              Navigator.pushNamed(context, '/addnewmeal'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
