import 'package:flutter/material.dart';
import '../theme/app_colors_light.dart';
import '../theme/app_sizes.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: AppSizes.f14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSizes.p8),
        TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppSizes.f14,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: AppColors.textSecondary,
              size: AppSizes.icon20,
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColors.background, // White inside
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.p16,
              horizontal: AppSizes.p16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
