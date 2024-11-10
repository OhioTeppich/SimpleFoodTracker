import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_food_tracker/application/diet/diet_bloc.dart';
import 'package:simple_food_tracker/presentation/core/custom_button.dart';
import 'package:simple_food_tracker/presentation/core/date_picker.dart';
import 'package:simple_food_tracker/presentation/core/progress_indicator.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietBloc, DietState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SimpleFoodTrackerColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Diet'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),
              const DatePicker(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 16.0,
                ),
                child: Text(
                  'Nutrition Intake',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CustomLinearProgressIndicator(
                consumedValue: state.consumedKcal,
                totalValue: state.totalKcal,
              ),
              Row(
                children: [
                  CustomCircularProgressInidicator(
                    progressColor: SimpleFoodTrackerColor.fatProgressColor,
                    percent: 0.3,
                    title: 'Fat',
                    value: state.consumedFat,
                  ),
                  CustomCircularProgressInidicator(
                    progressColor: SimpleFoodTrackerColor.proteinProgressColor,
                    percent: 0.3,
                    title: 'Protein',
                    value: state.consumedProtein,
                  )
                ],
              ),
              Center(
                child: CustomCircularProgressInidicator(
                  progressColor: SimpleFoodTrackerColor.carbProgressColor,
                  percent: 0.3,
                  title: 'Carbs',
                  value: state.consumedCarbs,
                ),
              ),
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
                  onTap: () => Navigator.pushNamed(context, '/mealtype'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildMacroInfo({
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TODO: CircularProgress'),
          Column(
            children: [Text(title), const Text('valueCal')],
          )
        ],
      ),
    );
  }
}
