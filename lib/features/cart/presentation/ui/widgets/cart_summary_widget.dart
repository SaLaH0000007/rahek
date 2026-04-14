import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/widgets/primary_button.dart';

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
      padding: const EdgeInsets.all(AppSizes.p16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r16),
          topRight: Radius.circular(AppSizes.r16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.f14,
                  ),
                ),
                Text(
                  'EGP $subTotal',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.f14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.p8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shipping',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.f14,
                  ),
                ),
                Text(
                  shippingCost == 0 ? 'Free' : 'EGP $shippingCost',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.f14,
                    color: shippingCost == 0
                        ? AppColors.success
                        : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.p12),
              child: Divider(height: 1, color: AppColors.border),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: AppSizes.f18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'EGP $total',
                  style: const TextStyle(
                    fontSize: AppSizes.f18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.p16),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: 'Proceed to Checkout',
                onPressed: onCheckout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
