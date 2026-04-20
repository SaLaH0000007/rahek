import 'package:flutter/material.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/theme/app_colors_light.dart';

class CartSummaryWidget extends StatelessWidget {
  final double subTotal;
  final double shippingCost;
  final double total;
  final VoidCallback onCheckout;

  const CartSummaryWidget({
    super.key,
    required this.subTotal,
    required this.shippingCost,
    required this.total,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppSizes.r4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CART TOTALS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.f16,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSizes.p24),

          _buildSummaryRow(
            'Subtotal',
            'EGP ${subTotal.toStringAsFixed(2)}',
            isBoldRight: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.p12),
            child: Divider(color: AppColors.border, height: 1),
          ),

          _buildShippingRow(
            'Shipping',
            'EGP\n${shippingCost.toStringAsFixed(2)}',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.p12),
            child: Divider(color: AppColors.border, height: 1),
          ),

          _buildSummaryRow('Tax', 'EGP 0.00'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.p12),
            child: Divider(color: AppColors.border, height: 1),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.f16,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'EGP ${total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.f18,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.p24),

          SizedBox(
            width: double.infinity,
            height: AppSizes.buttonHeight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: AppSizes.O,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r4),
                ),
              ),
              onPressed: onCheckout,
              child: const Text(
                'Proceed to checkout',
                style: TextStyle(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String title,
    String value, {
    bool isBoldRight = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: isBoldRight ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildShippingRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: AppColors.textPrimary)),
        Text(
          value,
          textAlign: TextAlign.right,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
