import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors_light.dart'; // تأكد من المسار
import '../theme/app_sizes.dart';

Widget customIconButton(IconData icon, VoidCallback? onTap) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20.0), // أو AppSizes.r16
    child: Padding(
      padding: const EdgeInsets.all(AppSizes.p4),
      child: Icon(
        icon,
        color: AppColors.textPrimary,
        size: AppSizes.iconMedium,
      ),
    ),
  );
}
