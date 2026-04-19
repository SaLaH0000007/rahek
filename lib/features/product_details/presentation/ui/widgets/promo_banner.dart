import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget promo_banner() {
  return Container(
    height: AppSizes.promoBannerHeight,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.bannerBackground,
      borderRadius: BorderRadius.circular(AppSizes.r8),
    ),
    child: Center(
      child: Image.asset(
        "assets/images/banner.png",
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.image, size: 80, color: AppColors.textSecondary),
      ),
    ),
  );
}
