import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget product_info() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Apple vinegar',
        style: TextStyle(fontSize: AppSizes.f22, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: AppSizes.p4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SKU: 1',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: AppSizes.f12,
                ),
              ),
              const Text(
                'In Stock',
                style: TextStyle(
                  color: AppColors.success,
                  fontSize: AppSizes.f12,
                ),
              ),
              Row(
                children: const [
                  Text(
                    'Share: ',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: AppSizes.f12,
                    ),
                  ),
                  Icon(Icons.facebook, size: AppSizes.iconSmall),
                  Icon(Icons.link, size: AppSizes.iconSmall),
                ],
              ),
            ],
          ),
          Row(
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star_border,
                color: AppColors.primary,
                size: AppSizes.iconSmall,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: AppSizes.p16),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'EGP 150.00',
            style: TextStyle(
              fontSize: AppSizes.f20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: AppSizes.p8),
          Text(
            'EGP 190.00',
            style: TextStyle(
              fontSize: AppSizes.f14,
              color: AppColors.textSecondary,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
      const SizedBox(height: AppSizes.p16),
      const Text(
        'Apple cider vinegar ingredients:\nNatural apple juice - acidity regulator - acetic acid (less than 5%).',
        style: TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppSizes.f13,
        ),
      ),
    ],
  );
}
