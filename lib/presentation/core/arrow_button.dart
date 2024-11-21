import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

enum ArrowDirection {
  left,
  right,
}

class ArrowButton extends StatefulWidget {
  final void Function()? _onTap;
  final ArrowDirection _arrowDirection;

  const ArrowButton({
    super.key,
    void Function()? onTap,
    ArrowDirection arrowDirection = ArrowDirection.left,
  })  : _arrowDirection = arrowDirection,
        _onTap = onTap;

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton>
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
      child: SizedBox(
        child: SvgPicture.asset(
          widget._arrowDirection == ArrowDirection.left
              ? 'assets/images/leftarrow.svg'
              : 'assets/images/rightarrow.svg',
          height: 50,
          width: 50,
        ),
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
      onTap: () => _animationController.forward(),
    );
  }
}
