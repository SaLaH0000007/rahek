// ui/widgets/order_details_card.dart
import 'package:flutter/material.dart';

import '../theme/app_colors_light.dart';
import '../theme/app_sizes.dart';


class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("ORDER NUMBER", style: TextStyle(fontSize: AppSizes.f12, color: AppColors.textSecondary)),
          const Text("#5", style: TextStyle(fontSize: AppSizes.f20, fontWeight: FontWeight.bold, color: AppColors.primary)),
          const SizedBox(height: AppSizes.p16),
          // باقي بيانات الـ Order Summary بنفس الطريقة...
        ],
      ),
    );
  }
}