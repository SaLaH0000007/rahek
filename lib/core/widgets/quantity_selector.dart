import 'package:flutter/material.dart';
import '../theme/app_colors_light.dart';
import '../theme/app_sizes.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.p12,
        vertical: AppSizes.p8,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$quantity',
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.f18,
            ),
          ),
          const SizedBox(width: AppSizes.p12),
          _buildIconBtn(
            Icons.remove,
            quantity > 1 ? AppColors.primary : AppColors.textSecondary,
            onDecrement,
          ),
          const SizedBox(width: AppSizes.p8),
          _buildIconBtn(Icons.add, AppColors.primary, onIncrement),
        ],
      ),
    );
  }

  Widget _buildIconBtn(IconData icon, Color color, VoidCallback onTap) {
    return Container(
      width: AppSizes.iconLarge,
      height: AppSizes.iconLarge,
      decoration: const BoxDecoration(
        color: AppColors.iconBackground,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: AppSizes.iconSmall, color: color),
        onPressed: onTap,
      ),
    );
  }
}
