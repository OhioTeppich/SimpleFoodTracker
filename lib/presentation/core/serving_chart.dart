import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

import '../../application/addmeal/add_meal_bloc.dart';

class ServingChart extends StatelessWidget {
  final AddMealState state;
  final Color chartColor;
  final String title;

  const ServingChart({
    super.key,
    required this.state,
    required this.chartColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            height: 50.0,
            width: 10.0,
            color: SimpleFoodTrackerColor.backgroundProgressColor,
            child: Container(
              color: chartColor,
            ).animate(autoPlay: true).shimmer(
                  duration: const Duration(milliseconds: 500),
                ),
          ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                ),
              ),
              Row(
                children: [
                  Text('55%', style: TextStyle(color: chartColor)),
                  Text('(${state.currentCarbs}g)')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
