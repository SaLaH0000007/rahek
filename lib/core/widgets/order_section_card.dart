// order_section_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors_light.dart';
import '../theme/app_sizes.dart';

class OrderSectionCard extends StatelessWidget {
  final String title;
  final IconData? icon; // علامة الـ ? هنا بتخلي الأيقونة اختيارية
  final Widget child;

  const OrderSectionCard({
    super.key,
    required this.title,
    this.icon, // شلنا كلمة required من هنا
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.r12.r),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // السطر ده هو السحر: لو فيه أيقونة ارسمها، لو مفيش متسيبش مكانها
              if (icon != null) ...[
                Icon(icon, size: 20.sp, color: AppColors.primary),
                SizedBox(width: 8.w),
              ],
              Text(
                title,
                style: TextStyle(
                  fontSize: AppSizes.f16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          child,
        ],
      ),
    );
  }
}