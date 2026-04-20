import 'package:flutter/material.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/theme/app_colors_light.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top part: Image + Title, Remove and Save buttons
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppSizes.s60,
              height: AppSizes.s80,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(AppSizes.r4),
              ),
              child: Image.asset(item.product.image, fit: BoxFit.cover),
            ),
            SizedBox(width: AppSizes.p16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onRemove,
                        child: Container(
                          padding: EdgeInsets.all(AppSizes.p4),
                          decoration: const BoxDecoration(
                            color: AppColors.iconBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            size: AppSizes.icon14,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.p8),
                      Text(
                        '${item.selectedWeight} gram',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.f14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.p8),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.r4),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.p12,
                        vertical: AppSizes.O,
                      ),
                      minimumSize: Size(AppSizes.O, AppSizes.s32),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border,
                      size: AppSizes.iconSmall,
                      color: AppColors.textPrimary,
                    ),
                    label: Text(
                      'Save for Later',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: AppSizes.f12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.p16),

        _buildInfoRow('Price', 'EGP ${item.product.price.toStringAsFixed(2)}'),
        SizedBox(height: AppSizes.p12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quantity',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            Container(
              height: AppSizes.s32,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(AppSizes.r4),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: onDecrement,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.p12),
                      child: Text(
                        '–',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: AppSizes.f16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(width: 1, color: AppColors.border),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
                    child: Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Container(width: 1, color: AppColors.border),
                  InkWell(
                    onTap: onIncrement,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.p12),
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: AppSizes.f16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.p12),

        // Product subtotal
        _buildInfoRow(
          'Subtotal',
          'EGP ${item.itemSubtotal.toStringAsFixed(2)}',
          isBoldRight: true,
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isBoldRight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: AppColors.textSecondary)),
        Text(
          value,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: isBoldRight ? FontWeight.bold : FontWeight.w600,
            fontSize: isBoldRight ? AppSizes.f16 : AppSizes.f14,
          ),
        ),
      ],
    );
  }
}
