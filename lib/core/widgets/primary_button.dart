import 'package:flutter/material.dart';
import '../theme/app_colors_light.dart';
import '../theme/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // لو null الزرار هيبقى رمادي

  const PrimaryButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.border,
          elevation: AppSizes.O,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.r8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: onPressed == null
                ? AppColors.textSecondary
                : AppColors.background,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.f16,
          ),
        ),
      ),
    );
  }
}
