import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/features_container.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/imageGallery.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/weight.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/product_info.dart';
import 'package:rahek/features/product_details/presentation/ui/widgets/promo_banner.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/quantity_selector.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/menu/bloc/menu_cubit.dart';
import '../../../../core/widgets/menu/bloc/menu_state.dart';
import '../../../../core/widgets/menu/ui/menu_wrapper.dart';
import '../../../cart/presentation/bloc/cart_cubit.dart';
import '../bloc/product_details_cubit.dart';
import '../bloc/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // 1. Provide ProductDetailsCubit for this specific screen
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..loadProduct(productId),
      // 2. Listen to MenuCubit to update the AppBar icon dynamically
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, menuState) {
          final menuCubit = MenuCubit.get(context);

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: CustomAppBar(
              isMenuOpen: menuCubit.isMenuOpen,
              onMenuPressed: () => menuCubit.toggleMenu(),
            ),
            // 3. Wrap the body with MenuWrapper to enable the side menu
            body: MenuWrapper(
              child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  if (state is ProductDetailsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (state is ProductDetailsError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: AppColors.error),
                      ),
                    );
                  }

                  if (state is ProductDetailsLoaded) {
                    final product = state.product;
                    final cubit = ProductDetailsCubit.get(context);

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(AppSizes.p16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          imageGallery(
                            imagePath: product.image,
                            isFavorite: product.isFavorite,
                            onFavoriteToggle: () => cubit.toggleFavorite(),
                          ),
                          SizedBox(height: AppSizes.p16),

                          product_info(
                            name: product.name,
                            price: product.price,
                            rating: product.rating,
                            description: product.description,
                            id: product.id,
                          ),
                          SizedBox(height: AppSizes.p16),

                          location_and_weight(
                            weights: product.weight,
                            selectedWeight: state.selectedWeight,
                            onSelect: (w) => cubit.selectWeight(w),
                          ),
                          SizedBox(height: AppSizes.p24),

                          Row(
                            children: [
                              QuantitySelector(
                                quantity: state.quantity,
                                onIncrement: () => cubit.increment(),
                                onDecrement: () => cubit.decrement(),
                              ),
                              SizedBox(width: AppSizes.p8),
                              Expanded(
                                child: PrimaryButton(
                                  text: 'Add to cart',
                                  onPressed: () {
                                    context.read<CartCubit>().addToCart(
                                      product: product,
                                      quantity: state.quantity,
                                      selectedWeight: state.selectedWeight,
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${product.name} added to cart',
                                          style: const TextStyle(
                                            color: AppColors.background,
                                          ),
                                        ),
                                        duration: const Duration(seconds: 2),
                                        backgroundColor: AppColors.primary,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: AppSizes.p8),
                              Expanded(
                                child: PrimaryButton(
                                  text: 'Buy now',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.p24),
                          features_container(),
                          SizedBox(height: AppSizes.p24),
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
        },
      ),
    );
  }
}
