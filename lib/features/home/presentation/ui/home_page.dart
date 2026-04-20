import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/home/presentation/ui/screens/widgets/side_menu_widget.dart';
import '../../../../core/shared/list.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/widgets/icon_bottun.dart';
import '../../../../core/widgets/menu/bloc/menu_cubit.dart';
import '../../../../core/widgets/menu/bloc/menu_state.dart';
import '../../../../core/widgets/menu/ui/menu_wrapper.dart';
import '../../../cart/presentation/bloc/cart_cubit.dart';
import '../../../product_details/data/models/product.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';

class HoneyPage extends StatelessWidget {
  HoneyPage({super.key});

  final List<String> imageList = [
    "assets/images/Container1.png",
    "assets/images/Container2.png",
    "assets/images/Container2.png",
    "assets/images/Container1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, menuState) {
        final menuCubit = MenuCubit.get(context);

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: CustomAppBar(
            isMenuOpen: menuCubit.isMenuOpen,
            onMenuPressed: () => menuCubit.toggleMenu(),
          ),
          body: MenuWrapper(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildBanner(),
                  _buildQuickOffers(),
                  SizedBox(height: AppSizes.p12),
                  _buildSectionTitle("New Products"),
                  SizedBox(height: AppSizes.p8),
                  _buildFilters(),
                  SizedBox(height: AppSizes.p12),
                  _buildProductGrid(context, HomeCubit.get(context)),
                  _buildSecondaryBanners(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Section: Main Promotional Banner
  Widget _buildBanner() {
    return Container(
      height: 150.0,
      width: double.infinity,
      margin: EdgeInsets.all(AppSizes.p12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.r12),
        image: const DecorationImage(
          image: AssetImage("assets/images/img.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Section: Quick Offer Images
  Widget _buildQuickOffers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/Container1.png", height: AppSizes.s60),
        SizedBox(width: AppSizes.p12),
        Image.asset("assets/images/Container2.png", height: AppSizes.s60),
      ],
    );
  }

  // Section: Section Titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: AppSizes.f18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  // Section: Category Filters
  Widget _buildFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _filterButton("New Products"),
        SizedBox(width: AppSizes.p8),
        _filterButton("Final Sale"),
        SizedBox(width: AppSizes.p8),
        _filterButton("Top Sales"),
      ],
    );
  }

  Widget _filterButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.p12,
        vertical: AppSizes.p8,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(color: AppColors.primary),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: AppSizes.f12, color: AppColors.textPrimary),
      ),
    );
  }

  // Section: Dynamic Product Grid from list.dart
  Widget _buildProductGrid(BuildContext context, HomeCubit cubit) {
    int getCrossAxisCount(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      if (screenWidth > 800) return 4;
      if (screenWidth > 600) return 3;
      return 2;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      padding: EdgeInsets.all(AppSizes.p12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(context),
        childAspectRatio: 0.55,
        crossAxisSpacing: AppSizes.p12,
        mainAxisSpacing: AppSizes.p12,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(context, products[index], cubit);
      },
    );
  }

  // Section: Individual Product Card Widget
  Widget _buildProductCard(
    BuildContext context,
    Product product,
    HomeCubit cubit,
  ) {
    final isFav = cubit.favoriteProductIds.contains(product.id);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: product.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppSizes.r8),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.p16),
                      child: Image.asset(product.image, fit: BoxFit.contain),
                    ),
                  ),
                  Positioned(
                    top: AppSizes.p8,
                    right: AppSizes.p8,
                    child: Column(
                      children: [
                        Icon(
                          Icons.swap_horiz,
                          color: AppColors.textSecondary,
                          size: AppSizes.icon20,
                        ),
                        SizedBox(height: AppSizes.p12),
                        customIconButton(
                          color: isFav
                              ? AppColors.primary
                              : AppColors.textSecondary,
                          icon: Icons.favorite,
                          onTap: () => cubit.toggleFavorite(product.id),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  index < product.rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: AppColors.primary,
                  size: AppSizes.iconSmall,
                ),
              ),
            ),
            SizedBox(height: AppSizes.p8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EGP ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: AppSizes.f16,
                    ),
                  ),
                  SizedBox(height: AppSizes.p2),
                  Text(
                    "EGP ${(product.price + 30).toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      decoration: TextDecoration.lineThrough,
                      fontSize: AppSizes.f12,
                    ),
                  ),
                  SizedBox(height: AppSizes.p2),
                  Text(
                    "20% off",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                      fontSize: AppSizes.f12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.p12),
            InkWell(
              onTap: () {
                final int defaultWeight =
                    (product.weight != null && product.weight!.isNotEmpty)
                    ? product.weight!.first
                    : 0;
                CartCubit.get(context).addToCart(
                  product: product,
                  quantity: 1,
                  selectedWeight: defaultWeight,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} added to cart!'),
                    backgroundColor: AppColors.success,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: AppSizes.p12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppSizes.r8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: AppColors.background,
                      size: AppSizes.iconSmall,
                    ),
                    SizedBox(width: AppSizes.p8),
                    Text(
                      "Add to cart",
                      style: TextStyle(
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.f13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section: Bottom Banners Grid
  Widget _buildSecondaryBanners() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      padding: EdgeInsets.all(AppSizes.p12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p12,
        mainAxisSpacing: AppSizes.p12,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          child: Image.asset(
            imageList[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
