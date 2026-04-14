import 'package:flutter/material.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/thumbnail.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget imageGallery({
  required String imagePath,
  required bool isFavorite,
  required VoidCallback onFavoriteToggle,
}) {
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
              child: imagePath.isNotEmpty
                  ? Image.asset(
                      imagePath,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image,
                          size: 80,
                          color: AppColors.textSecondary,
                        );
                      },
                    )
                  : const Icon(
                      Icons.image,
                      size: 80,
                      color: AppColors.textSecondary,
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
            Positioned(
              top: 0,
              right: 0,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () {},
                  ),
                  // زرار المفضلة بقى ديناميك
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                    onPressed: onFavoriteToggle,
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
      // عرض الصورة المصغرة
      Row(children: [thumbnail(isActive: true, imagePath: imagePath)]),
    ],
  );
}
