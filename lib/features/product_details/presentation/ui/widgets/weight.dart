// ملف weight.dart
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

Widget location_and_weight({
  required List<int> weights,
  required int selectedWeight,
  required Function(int) onSelect,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // يدعم RTL تلقائياً
    children: [
      const SizedBox(height: AppSizes.p8),
      const Text('Weight', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: AppSizes.p4),
      Wrap(
        spacing: 8,
        children: weights
            .map(
              (w) => GestureDetector(
                onTap: () => onSelect(w),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: w == selectedWeight
                        ? AppColors.primary
                        : Colors.white,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '$w ml',
                    style: TextStyle(
                      color: w == selectedWeight
                          ? Colors.white
                          : AppColors.primary,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}
