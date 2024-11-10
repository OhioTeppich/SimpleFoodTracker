import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

class CustomCircularProgressInidicator extends StatelessWidget {
  final Color progressColor;
  final double percent;
  final String title;
  final double value;

  const CustomCircularProgressInidicator({
    super.key,
    required this.progressColor,
    required this.percent,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2 - 24,
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularPercentIndicator(
            radius: 25,
            lineWidth: 4.0,
            backgroundColor: SimpleFoodTrackerColor.backgroundProgressColor,
            progressColor: progressColor,
            percent: percent,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Row(
                children: [
                  Text(
                    '$value',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: progressColor,
                    ),
                  ),
                  const Text(
                    'Cal',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      color: SimpleFoodTrackerColor.totalFontColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomLinearProgressIndicator extends StatelessWidget {
  final double consumedValue;
  final double totalValue;

  const CustomLinearProgressIndicator({
    super.key,
    required this.consumedValue,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Consumed Today'),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
              ),
              child: Row(
                children: [
                  Text(
                    '$consumedValue',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: SimpleFoodTrackerColor.caloriesProgressColor,
                    ),
                  ),
                  Text(
                    ' / $totalValue Cal',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: SimpleFoodTrackerColor.totalFontColor,
                    ),
                  ),
                ],
              ),
            ),
            LinearPercentIndicator(
              padding: const EdgeInsets.all(0),
              percent: totalValue == 0 ? 1.0 : consumedValue / totalValue,
              lineHeight: 6.0,
              barRadius: const Radius.circular(20.0),
              backgroundColor: SimpleFoodTrackerColor.backgroundProgressColor,
              progressColor: SimpleFoodTrackerColor.caloriesProgressColor,
            )
          ],
        ),
      ),
    );
  }
}
