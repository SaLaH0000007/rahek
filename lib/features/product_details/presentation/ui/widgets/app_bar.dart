import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

AppBar app_bar() {
  return AppBar(
    backgroundColor: AppColors.background,
    elevation: 0,
    leading: const Icon(Icons.menu, color: AppColors.textPrimary),
    actions: [
      const Icon(Icons.search, color: AppColors.textPrimary),
      const SizedBox(width: AppSizes.p8),
      Center(child: Image.asset("assets/images/logo.png", width: 80)),
      const SizedBox(width: AppSizes.p16),
    ],
  );
}
