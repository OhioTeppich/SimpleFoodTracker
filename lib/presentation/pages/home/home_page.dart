import 'package:flutter/material.dart';
import 'package:simple_food_tracker/presentation/core/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
          child: CustomButton(
            text: '+ Add',
          ),
        ),
      ),
    );
  }
}
