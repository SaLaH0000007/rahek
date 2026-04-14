import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/app_bar.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/features_container.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/imageGallery.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/location_and_weight.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/product_info.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/promo_banner.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/quantity_selector.dart';
import '../bloc/product_details_cubit.dart';
import '../bloc/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: app_bar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageGallery(),
            const SizedBox(height: AppSizes.p16),

            product_info(),
            const SizedBox(height: AppSizes.p16),

            location_and_weight(),
            const SizedBox(height: AppSizes.p24),

            Row(
              children: [
                BlocBuilder<ProductNumberCubit, ProductNumberState>(
                  builder: (context, state) {
                    final cubit = ProductNumberCubit.get(context);

                    return QuantitySelector(
                      quantity: cubit.counter,
                      onIncrement: () {
                        cubit.increment();
                      },
                      onDecrement: () {
                        cubit.decrement();
                      },
                    );
                  },
                ),
                const SizedBox(width: AppSizes.p8),
                Expanded(
                  child: PrimaryButton(text: 'Add to cart', onPressed: () {}),
                ),
                const SizedBox(width: AppSizes.p8),
                Expanded(
                  child: PrimaryButton(text: 'Buy now', onPressed: () {}),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.p24),

            features_container(),
            const SizedBox(height: AppSizes.p24),

            promo_banner(),
          ],
        ),
      ),
    );
  }
}
