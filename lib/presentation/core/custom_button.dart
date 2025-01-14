import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_food_tracker/presentation/core/simple_food_tracker_theme.dart';

class CustomButton extends StatefulWidget {
  final Widget _text;
  final void Function()? _onTap;
  final double? _height;
  final double? _width;
  final EdgeInsetsGeometry? _padding;

  const CustomButton({
    super.key,
    required Widget text,
    void Function()? onTap,
    double? height,
    double? width,
    EdgeInsetsGeometry? padding,
  })  : _padding = padding,
        _height = height,
        _width = width,
        _onTap = onTap,
        _text = text;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
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
        height: widget._height,
        width: widget._width,
        padding: widget._padding,
        decoration: const BoxDecoration(
            color: SimpleFoodTrackerColor.clickAbleColor,
            borderRadius: BorderRadius.all(Radius.circular(12.5))),
        child: widget._text,
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
