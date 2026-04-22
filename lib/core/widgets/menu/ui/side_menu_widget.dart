import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../features/auth/presentation/bloc/global_auth_cubit.dart';
import '../../../../features/auth/presentation/bloc/global_auth_state.dart';
import '../../../../features/auth/presentation/ui/login_screen.dart';

import '../bloc/menu_cubit.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
      height: double.infinity,
      color: AppColors.background,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.p16),

            // Menu Items List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.p8),
                children: [
                  _buildMenuItem(Icons.home, 'Home', () {
                    MenuCubit.get(context).toggleMenu();
                  }),
                  _buildMenuItem(
                    Icons.grid_view,
                    'Categories',
                    () {},
                    hasDropdown: true,
                  ),
                  _buildMenuItem(
                    Icons.shopping_cart_outlined,
                    'My orders',
                    () {},
                  ),
                  _buildMenuItem(Icons.info_outline, 'About us', () {}),
                  _buildMenuItem(Icons.email_outlined, 'Contact us', () {}),
                  _buildMenuItem(Icons.language, 'Language - English', () {}),
                ],
              ),
            ),

            // Dynamic Authentication Button
            Padding(
              padding: EdgeInsets.all(AppSizes.p16),
              child: BlocBuilder<GlobalAuthCubit, GlobalAuthState>(
                builder: (context, state) {
                  final bool isLoggedIn = state is Authenticated;

                  return SizedBox(
                    width: double.infinity,
                    height: AppSizes.buttonHeight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLoggedIn
                            ? AppColors.error
                            : AppColors.primary,
                        elevation: AppSizes.O,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.r8),
                        ),
                      ),
                      onPressed: () {
                        // 1. Close the side menu first to clean up the UI
                        MenuCubit.get(context).toggleMenu();

                        // 2. Perform the appropriate authentication action
                        if (isLoggedIn) {
                          GlobalAuthCubit.get(context).logout();
                        } else {
                          // Pushing LoginScreen hides the BottomNavigationBar
                          // because it is pushed over the MainLayoutScreen
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        isLoggedIn ? Icons.logout : Icons.login,
                        color: AppColors.background,
                        size: AppSizes.iconMedium,
                      ),
                      label: Text(
                        isLoggedIn ? 'Sign out' : 'Sign in',
                        style: TextStyle(
                          color: AppColors.background,
                          fontSize: AppSizes.f16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable helper method for menu list tiles
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
