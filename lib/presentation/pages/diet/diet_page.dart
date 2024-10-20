import 'package:flutter/material.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SimpleFoodTrackerTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Diet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nutrition Intake'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Consumed Today'),
                //TODO: Need values from BloC
                Text('value/Goal'),
                Text('TODO: Search PUB for ProgressBar?')
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  buildMacroInfo(title: 'carbs'),
                  buildMacroInfo(title: 'protein'),
                  buildMacroInfo(title: 'fat'),
                  buildMacroInfo(title: 'kcal'),
                ],
              ),
            ),
          )
        ],
      ),
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
