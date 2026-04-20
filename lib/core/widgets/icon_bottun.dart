import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../theme/app_sizes.dart';

Widget customIconButton({
  IconData? icon,
  Color? color,
  double? size,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(AppSizes.r16),
    child: Padding(
      padding: EdgeInsets.all(AppSizes.p4),
      child: Icon(
        icon,
        color: color ?? AppColors.textPrimary,
        size: size ?? AppSizes.iconMedium,
      ),
    ),
  );
}
