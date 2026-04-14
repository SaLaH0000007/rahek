import 'package:flutter/material.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/thumbnail.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget imageGallery() {
  return Column(
    children: [
      Container(
        height: AppSizes.galleryHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(AppSizes.r8),
        ),
        child: Stack(
          children: [
            Center(
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
            ),
            const Positioned(
              top: AppSizes.p12,
              left: AppSizes.p12,
              child: Text(
                '20% off',
                style: TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Positioned(
              top: AppSizes.p8,
              right: AppSizes.p8,
              child: Column(
                children: [
                  Icon(
                    Icons.share,
                    color: AppColors.textSecondary,
                    size: AppSizes.iconMedium,
                  ),
                  SizedBox(height: AppSizes.p8),
                  Icon(
                    Icons.favorite_border,
                    color: AppColors.textSecondary,
                    size: AppSizes.iconMedium,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: AppSizes.p12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.p16,
                    vertical: AppSizes.p4,
                  ),
                  color: Colors.black54,
                  child: const Text(
                    'Tap to zoom',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: AppSizes.f12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: AppSizes.p8),
      Row(children: [thumbnail(isActive: true)]),
    ],
  );
}
