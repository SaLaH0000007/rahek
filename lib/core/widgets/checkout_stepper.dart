import 'package:flutter/material.dart';
import '../theme/app_colors_light.dart';
import '../theme/app_sizes.dart';

class CheckoutStepper extends StatelessWidget {
  final int currentStep;

  const CheckoutStepper({super.key, required this.currentStep});

  static const _steps = ["Shopping Cart", "Checkout", "Order Complete"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.p8),
            child: Icon(
              Icons.chevron_right,
              size: AppSizes.iconSmall,
              color: AppColors.textSecondary,
            ),
          );
        }

        final stepIndex = index ~/ 2;
        final isActive = stepIndex == currentStep;

        return Text(
          _steps[stepIndex],
          style: TextStyle(
            fontSize: AppSizes.f14,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,

            color: isActive ? AppColors.primary : AppColors.textSecondary,
          ),
        );
      }),
    );
  }
}
