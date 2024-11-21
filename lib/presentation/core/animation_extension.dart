import 'package:flutter_animate/flutter_animate.dart';

extension AddMealTypeEffectExtension<T extends AnimateManager<T>> on T {
  T mealTypeBoxAnimation({
    bool ltr = true,
    required Duration delay,
  }) =>
      addEffect(
        MoveEffect(
          delay: delay,
          duration: const Duration(milliseconds: 400),
          begin: MoveEffect.neutralValue.copyWith(
            dx: ltr ? -400.0 : 400.0,
          ),
        ),
      ).addEffect(const FadeEffect());
}
