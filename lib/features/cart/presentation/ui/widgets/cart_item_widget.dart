import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../data/model/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.p8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppSizes.r8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(AppSizes.r4),
            ),
            child: item.product.image.isNotEmpty
                ? Image.asset(item.product.image, fit: BoxFit.cover)
                : const Icon(Icons.image, color: AppColors.textSecondary),
          ),
          const SizedBox(width: AppSizes.p12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.f16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.error,
                        size: AppSizes.iconMedium,
                      ),
                      onPressed: onRemove,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.p4),
                Text(
                  'Weight: ${item.selectedWeight}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.f12,
                  ),
                ),
                const SizedBox(height: AppSizes.p8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${item.itemSubtotal}',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.f14,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: onDecrement,
                          child: const Icon(
                            Icons.remove_circle_outline,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: AppSizes.p12),
                        Text(
                          '${item.quantity}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.f14,
                          ),
                        ),
                        const SizedBox(width: AppSizes.p12),
                        InkWell(
                          onTap: onIncrement,
                          child: const Icon(
                            Icons.add_circle_outline,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
