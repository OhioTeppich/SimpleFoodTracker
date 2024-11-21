import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_food_tracker/application/addmeal/add_meal_bloc.dart';
import 'package:simple_food_tracker/domain/daily_food/daily_food.dart';
import 'package:simple_food_tracker/presentation/core/custom_button.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

import '../core/info_box.dart';
import '../core/serving_button.dart';
import '../core/serving_chart.dart';

class AddMealPage extends StatelessWidget {
  const AddMealPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;

    final String title = arguments?['title'];

    return BlocBuilder<AddMealBloc, AddMealState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SimpleFoodTrackerColor.backgroundColor,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: Text(title),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  color: Colors.white,
                  height: 50,
                  width: double.infinity,
                  child: const Center(child: Text('TODO: Tags')),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 12.0,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.5),
                              ),
                            ),
                            hintText: 'Search...',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: CarouselSlider.builder(
                          itemCount: state.mealNames.length,
                          itemBuilder: (context, index, __) {
                            return const Placeholder();
                          },
                          options: CarouselOptions(
                            autoPlay: false,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) => context
                                .read<AddMealBloc>()
                                .add(ChangeSelectedMealEvent(newIndex: index)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: Text(
                          state.mealNames[state.selectedMealIndex],
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ServingButton(
                            imagePath: 'assets/images/minus.svg',
                            onTap: () {},
                          ),
                          const SizedBox(width: 20.0),
                          SvgPicture.asset(
                            'assets/images/servings.svg',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 20.0),
                          ServingButton(
                            imagePath: 'assets/images/plus.svg',
                            onTap: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InfoBox(
                              state: state,
                              backgroundColor:
                                  SimpleFoodTrackerColor.clickAbleColor,
                              imagePath: 'assets/images/clock.svg',
                              text: const Text(
                                '10+15 Min',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
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
                            InfoBox(
                              state: state,
                              backgroundColor:
                                  SimpleFoodTrackerColor.caloriesProgressColor,
                              imagePath: 'assets/images/flame.svg',
                              text: Text(
                                '${state.currentKcal} Cal',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: CustomButton(
                          text: const Center(
                            child: Text(
                              '+ Add Meals',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          width: double.infinity,
                          onTap: () {
                            context.read<AddMealBloc>().add(
                                  AddDailyFoodEvent(
                                    data: DailyFood(
                                      id: 'id',
                                      foodIds: const ['nichts'],
                                      mealIds: const ['viel'],
                                      date: DateTime.now(),
                                    ),
                                  ),
                                );
                          },
                        ),
                      ),
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
