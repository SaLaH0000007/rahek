import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
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
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartLoaded) {
            if (state.items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Return to Shop'),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(AppSizes.p16),
                    itemCount: state.items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppSizes.p12),
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
                ),
                CartSummaryWidget(
                  subTotal: state.subTotal,
                  shippingCost: state.shippingCost,
                  total: state.total,
                  onCheckout: () {
                    // TODO: Navigate to checkout screen
                  },
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
