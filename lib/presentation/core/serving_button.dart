import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

class ServingButton extends StatefulWidget {
  final String _imagePath;
  final void Function()? _onTap;

  const ServingButton({
    super.key,
    required String imagePath,
    required void Function()? onTap,
  })  : _onTap = onTap,
        _imagePath = imagePath;

  @override
  State<ServingButton> createState() => _ServingButtonState();
}

class _ServingButtonState extends State<ServingButton>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _animationController.forward(),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          border: Border.all(
            width: 2.0,
            color: SimpleFoodTrackerColor.backgroundProgressColor,
          ),
        ),
        child: SvgPicture.asset(widget._imagePath),
      )
          .animate(
              controller: _animationController,
              autoPlay: false,
              onComplete: (controller) => controller.reverse()
                ..whenComplete(() => widget._onTap?.call()))
          .scale(
              duration: const Duration(milliseconds: 75),
              begin: const Offset(1.0, 1.0),
              end: const Offset(0.9, 0.9)),
    );
  }
}
