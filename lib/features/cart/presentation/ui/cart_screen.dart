import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/core/widgets/custom_appbar.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../bloc/cart_cubit.dart';
import '../bloc/cart_state.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/cart_summary_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return _buildEmptyCart(context);
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Top navigation bar (Breadcrumbs)
                  _buildBreadcrumbs(),
                  const SizedBox(height: AppSizes.p24),

                  // 2. List of products in the cart
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.items.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: AppSizes.p32,
                      color: AppColors.border,
                    ),
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return CartItemWidget(
                        item: item,
                        onIncrement: () =>
                            CartCubit.get(context).incrementItem(index),
                        onDecrement: () =>
                            CartCubit.get(context).decrementItem(index),
                        onRemove: () =>
                            CartCubit.get(context).removeItem(index),
                      );
                    },
                  ),
                  const SizedBox(height: AppSizes.p24),

                  // 3. Buttons (Continue Shopping / Clear Cart)
                  _buildCartActionButtons(context),
                  const SizedBox(height: AppSizes.p32),

                  // 4. Discount Coupon
                  _buildCouponSection(),
                  const SizedBox(height: AppSizes.p32),

                  // 5. Invoice Summary
                  CartSummaryWidget(
                    subTotal: state.subTotal,
                    shippingCost: state.shippingCost,
                    total: state.total,
                    onCheckout: () {
                      // TODO: Navigate to checkout screen
                    },
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildBreadcrumbs() {
    return Row(
      children: const [
        Text(
          'Shopping Cart',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.f12,
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
          size: AppSizes.iconSmall,
        ),
        Text(
          'Checkout',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppSizes.f12,
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
          size: AppSizes.iconSmall,
        ),
        Text(
          'Order Complete',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppSizes.f12,
          ),
        ),
      ],
    );
  }

  Widget _buildCartActionButtons(BuildContext context) {
    return Column(
      children: [
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
            onPressed: () {},
            child: const Text(
              'CONTINUE SHOPPING',
              style: TextStyle(
                color: AppColors.background,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.p12),
        SizedBox(
          width: double.infinity,
          height: AppSizes.buttonHeight,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.border, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.r4),
              ),
            ),
            onPressed: () => CartCubit.get(context).clearCart(),
            child: const Text(
              'CLEAR CART',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCouponSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Coupon Discount',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.f16,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSizes.p12),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter coupon code here...',
            hintStyle: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppSizes.f14,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSizes.p16,
              vertical: AppSizes.p14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r4),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.r4),
              borderSide: const BorderSide(color: AppColors.border),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.p12),
        SizedBox(
          width: double.infinity,
          height: AppSizes.buttonHeight,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.textPrimary, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.r4),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'APPLY COUPON',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: AppSizes.s80,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: AppSizes.p16),
          const Text(
            'Your cart is currently empty.',
            style: TextStyle(
              fontSize: AppSizes.f18,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSizes.p24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: const Text(
              'Return to Shop',
              style: TextStyle(color: AppColors.background),
            ),
          ),
        ],
      ),
    );
  }
}
