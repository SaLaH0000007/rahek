import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/app_bar.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/features_container.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/imageGallery.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/weight.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/product_info.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/promo_banner.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/quantity_selector.dart';
import '../../../cart/presentation/bloc/cart_cubit.dart';
import '../bloc/product_details_cubit.dart';
import '../bloc/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId; // ضفنا ده عشان نعرف إحنا فاتحين أنهي منتج

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // بنعمل Provide للـ Cubit ونشغل دالة getProductDetails أول ما الصفحة تفتح
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..loadProduct(productId),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar:
            app_bar(), // يفضل تخليها AppBar عادية أو widget مباصي ليها داتا لو محتاج
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            // 1. حالة التحميل
            if (state is ProductDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // 2. حالة الإيرور
            if (state is ProductDetailsError) {
              return Center(child: Text(state.message));
            }

            // 3. حالة النجاح وعرض الداتا
            if (state is ProductDetailsLoaded) {
              final product = state.product;
              final cubit = ProductDetailsCubit.get(context);

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // معرض الصور الديناميكي
                    imageGallery(
                      imagePath: product.image,
                      isFavorite: product.isFavorite,
                      onFavoriteToggle: () => cubit.toggleFavorite(),
                    ),
                    const SizedBox(height: AppSizes.p16),

                    // معلومات المنتج الديناميكية
                    product_info(
                      name: product.name,
                      price: product.price,
                      rating: product.rating,
                      description: product.description,
                      id: product.id,
                    ),
                    const SizedBox(height: AppSizes.p16),

                    // الموقع والوزن (اختيار تفاعلي)
                    location_and_weight(
                      weights: product.weight,
                      selectedWeight: state.selectedWeight,
                      onSelect: (w) => cubit.selectWeight(w),
                    ),
                    const SizedBox(height: AppSizes.p24),

                    // التحكم في الكمية وأزرار الشراء
                    Row(
                      children: [
                        QuantitySelector(
                          quantity: state.quantity,
                          onIncrement: () => cubit.increment(),
                          onDecrement: () => cubit.decrement(),
                        ),
                        const SizedBox(width: AppSizes.p8),
                        Expanded(
                          child: PrimaryButton(
                            text: 'Add to cart',
                            onPressed: () {
                              context.read<CartCubit>().addToCart(
                                product: product,
                                quantity: state.quantity,
                                selectedWeight: state.selectedWeight,
                              );

                              // Optional: Show a snackbar for feedback
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${product.name} added to cart',
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: AppColors.primary,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: AppSizes.p8),
                        Expanded(
                          child: PrimaryButton(
                            text: 'Buy now',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.p24),
                    features_container(),
                    const SizedBox(height: AppSizes.p24),
                    promo_banner(),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
