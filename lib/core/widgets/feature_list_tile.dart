import 'package:flutter/material.dart';
import '../theme/app_colors_light.dart';
import '../theme/app_sizes.dart';

class FeatureListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.textPrimary,
        size: AppSizes.iconLarge,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: AppSizes.f13,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: AppSizes.f11,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
