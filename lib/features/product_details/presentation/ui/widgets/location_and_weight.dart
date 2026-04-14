import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget location_and_weight() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Product location: Tanta',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppSizes.f12,
        ),
      ),
      const Text(
        'Weight: 1',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppSizes.f12,
        ),
      ),
      const SizedBox(height: AppSizes.p8),
      const Text('Weight', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: AppSizes.p4),
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.p16,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.r4),
        ),
        child: const Text(
          '275 ml',
          style: TextStyle(color: AppColors.background),
        ),
      ),
    ],
  );
}
