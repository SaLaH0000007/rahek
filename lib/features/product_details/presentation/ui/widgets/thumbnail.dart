import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget thumbnail({required bool isActive}) {
  return Container(
    width: AppSizes.thumbnailSize,
    height: AppSizes.thumbnailSize,
    decoration: BoxDecoration(
      border: Border.all(
        color: isActive ? AppColors.primary : AppColors.border,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(AppSizes.r4),
    ),
    child: Image.asset(
      "assets/images/Apple_cider_vinegar.png",
      errorBuilder: (context, error, stackTrace) {
        return const Icon(
          Icons.image,
          size: 80,
          color: AppColors.textSecondary,
        );
      },
    ),
  );
}
