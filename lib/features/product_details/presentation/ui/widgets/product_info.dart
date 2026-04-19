import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget product_info({
  required String name,
  required double price,
  required double rating,
  required String description,
  required int id,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
        style: const TextStyle(
          fontSize: AppSizes.f22,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: AppSizes.p4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SKU: $id',
                style: const TextStyle(
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
          // ديناميكية التقييم (النجوم)
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
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
        children: [
          Text(
            'EGP $price',
            style: const TextStyle(
              fontSize: AppSizes.f20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: AppSizes.p8),
          // السعر القديم (ممكن نخليه السعر + 20% كمثال بما إن عندك خصم)
          Text(
            'EGP ${price + (price * 0.20)}',
            style: const TextStyle(
              fontSize: AppSizes.f14,
              color: AppColors.textSecondary,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
      const SizedBox(height: AppSizes.p16),
      Text(
        description,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppSizes.f13,
        ),
      ),
    ],
  );
}
