import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors_light.dart';
import '../../../../../../core/theme/app_sizes.dart';
import '../../../bloc/home_cubit.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65, // 75% of screen width
      height: double.infinity,
      color: AppColors.background,
      child: Column(
        children: [
          SizedBox(height: AppSizes.p16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.p8),
              children: [
                _buildMenuItem(Icons.home, 'Home', () {
                  Navigator.of(context).pushNamed('/home');
                }),
                _buildMenuItem(
                  Icons.grid_view,
                  'Categories',
                  () {},
                  hasDropdown: true,
                ),
                _buildMenuItem(Icons.shopping_cart, 'My orders', () {}),
                _buildMenuItem(Icons.info, 'About us', () {}),
                _buildMenuItem(Icons.email, 'Contact us', () {}),
                _buildMenuItem(
                  Icons.language_sharp,
                  'Language - English',
                  () {},
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(AppSizes.p16),
            child: SizedBox(
              width: double.infinity,
              height: AppSizes.buttonHeight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: AppSizes.O,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.login, color: AppColors.background),
                label: Text(
                  'Sign in',
                  style: TextStyle(
                    color: AppColors.background,
                    fontSize: AppSizes.f16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool hasDropdown = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.textSecondary,
        size: AppSizes.iconMedium,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: AppSizes.f14,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: hasDropdown
          ? const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.textSecondary,
            )
          : null,
      onTap: onTap,
    );
  }
}
