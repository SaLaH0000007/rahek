// widgets/summary_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const SummaryRow({super.key, required this.label, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.p4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: AppSizes.f14.sp, color: AppColors.textSecondary)),
          Text(value, style: TextStyle(
            fontSize: isBold ? AppSizes.f20.sp : AppSizes.f14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isBold ? AppColors.primary : AppColors.textPrimary,
          )),
        ],
      ),
    );
  }
}