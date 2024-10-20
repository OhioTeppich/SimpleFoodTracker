import 'package:flutter/material.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 75),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticInOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: () async {
          await _animationController.forward();
          await _animationController.reverse();
          widget.onTap;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
              color: SimpleFoodTrackerTheme.clickAbleColor,
              borderRadius: BorderRadius.all(Radius.circular(12.5))),
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
