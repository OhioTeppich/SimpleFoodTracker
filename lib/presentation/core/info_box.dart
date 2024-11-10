import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_food_tracker/application/addmeal/add_meal_bloc.dart';

class InfoBox extends StatelessWidget {
  final AddMealState state;
  final Color backgroundColor;
  final String imagePath;
  final String text;

  const InfoBox({
    super.key,
    required this.state,
    required this.backgroundColor,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 40.0,
            width: 40.0,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
