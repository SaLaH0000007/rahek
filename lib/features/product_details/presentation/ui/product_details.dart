import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/quantity_selector.dart';
import '../../../../../core/widgets/feature_list_tile.dart';
import '../bloc/product_details_cubit.dart';
import '../bloc/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageGallery(),
            const SizedBox(height: AppSizes.p16),

            _buildProductInfo(),
            const SizedBox(height: AppSizes.p16),

            _buildLocationAndWeight(),
            const SizedBox(height: AppSizes.p24),

            // صف الأزرار مجهز للـ Bloc
            Row(
              children: [
                BlocBuilder<ProductNumberCubit, ProductNumberState>(
                  builder: (context, state) {
                    // هنجيب قيمة الكاونتر من الـ Cubit
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

            _buildFeaturesContainer(),
            const SizedBox(height: AppSizes.p24),

            _buildPromoBanner(),
          ],
        ),
      ),
    );
  }

  // --- Private Helpers عشان الكود يفضل Clean ---

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: const Icon(Icons.menu, color: AppColors.textPrimary),
      actions: [
        const Icon(Icons.search, color: AppColors.textPrimary),
        const SizedBox(width: AppSizes.p8),
        Center(child: Image.asset("assets/images/logo.png", width: 80)),
        const SizedBox(width: AppSizes.p16),
      ],
    );
  }

  Widget _buildImageGallery() {
    return Column(
      children: [
        Container(
          height: AppSizes.galleryHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppSizes.r8),
          ),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/Apple_cider_vinegar.png",
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image,
                      size: 80,
                      color: AppColors.textSecondary,
                    );
                  },
                ),
              ),
              const Positioned(
                top: AppSizes.p12,
                left: AppSizes.p12,
                child: Text(
                  '20% off',
                  style: TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Positioned(
                top: AppSizes.p8,
                right: AppSizes.p8,
                child: Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: AppColors.textSecondary,
                      size: AppSizes.iconMedium,
                    ),
                    SizedBox(height: AppSizes.p8),
                    Icon(
                      Icons.favorite_border,
                      color: AppColors.textSecondary,
                      size: AppSizes.iconMedium,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: AppSizes.p12,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.p16,
                      vertical: AppSizes.p4,
                    ),
                    color: Colors.black54,
                    child: const Text(
                      'Tap to zoom',
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: AppSizes.f12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.p8),
        Row(
          children: [
            _buildThumbnail(isActive: true),
            const SizedBox(width: AppSizes.p8),
            _buildThumbnail(isActive: false),
          ],
        ),
      ],
    );
  }

  Widget _buildThumbnail({required bool isActive}) {
    return Container(
      width: AppSizes.thumbnailSize,
      height: AppSizes.thumbnailSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ? AppColors.primary : AppColors.border,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(AppSizes.r4),
      ),
      child: Image.asset(
        "assets/images/Apple_cider_vinegar.png",
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.image,
            size: 80,
            color: AppColors.textSecondary,
          );
        },
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Apple vinegar',
          style: TextStyle(fontSize: AppSizes.f22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.p4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SKU: 1',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.f12,
                  ),
                ),
                const Text(
                  'In Stock',
                  style: TextStyle(
                    color: AppColors.success,
                    fontSize: AppSizes.f12,
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Share: ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: AppSizes.f12,
                      ),
                    ),
                    Icon(Icons.facebook, size: AppSizes.iconSmall),
                    Icon(Icons.link, size: AppSizes.iconSmall),
                  ],
                ),
              ],
            ),
            Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star_border,
                  color: AppColors.primary,
                  size: AppSizes.iconSmall,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.p16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'EGP 150.00',
              style: TextStyle(
                fontSize: AppSizes.f20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: AppSizes.p8),
            Text(
              'EGP 190.00',
              style: TextStyle(
                fontSize: AppSizes.f14,
                color: AppColors.textSecondary,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.p16),
        const Text(
          'Apple cider vinegar ingredients:\nNatural apple juice - acidity regulator - acetic acid (less than 5%).',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppSizes.f13,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndWeight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product location: Tanta',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppSizes.f12,
          ),
        ),
        const Text(
          'Weight: 1',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppSizes.f12,
          ),
        ),
        const SizedBox(height: AppSizes.p8),
        const Text('Weight', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: AppSizes.p4),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.p16,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSizes.r4),
          ),
          child: const Text(
            '275 ml',
            style: TextStyle(color: AppColors.background),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Column(
        children: const [
          FeatureListTile(
            icon: Icons.local_shipping,
            title: 'Free Shipping & Returns',
            subtitle: 'For all orders over 1000 EGP',
          ),
          Divider(height: 1),
          FeatureListTile(
            icon: Icons.security,
            title: 'Secure Payment',
            subtitle: 'We ensure secure payment',
          ),
          Divider(height: 1),
          FeatureListTile(
            icon: Icons.money_off,
            title: 'Money Back Guarantee',
            subtitle: 'Any back within 30 days',
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: AppSizes.promoBannerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bannerBackground,
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Center(
        child: Image.asset(
          "assets/images/banner.png",
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image, size: 80, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
