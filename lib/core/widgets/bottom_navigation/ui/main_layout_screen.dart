import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/cart/presentation/ui/cart_screen.dart';
import '../../../../features/home/presentation/ui/home_navigator.dart';
import '../../../theme/app_colors_light.dart';
import '../../../theme/app_sizes.dart'; // Make sure to import AppSizes
import '../bloc/bottom_navigation_cubit.dart';
import '../bloc/bottom_navigation_state.dart';

class MainLayoutScreen extends StatelessWidget {
  MainLayoutScreen({super.key});

  final List<Widget> _screens = [
    const HomeNavigator(),
    const CartScreen(),
    const Center(child: Text('Favorites Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomNavigationCubit(),
      child: BlocConsumer<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) => Scaffold(
          body: IndexedStack(
            index: BottomNavigationCubit.get(context).currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: SafeArea(
            child: SizedBox(
              height: AppSizes.bottomNavigationBarHeight,
              child: BottomNavigationBar(
                backgroundColor: AppColors.primary,
                type: BottomNavigationBarType.fixed,
                elevation:
                    AppSizes.O, // Removed shadow for a flat look like the image
                // Hide labels completely
                showSelectedLabels: false,
                showUnselectedLabels: false,

                // Unselected icons color (Solid White)
                unselectedItemColor: AppColors.background,

                currentIndex: BottomNavigationCubit.get(context).currentIndex,
                onTap: BottomNavigationCubit.get(context).onPress,

                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined),
                    activeIcon: _buildActiveIcon(Icons.home),
                    label: "Home", // Label is required but won't show
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    activeIcon: _buildActiveIcon(Icons.shopping_cart),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.favorite_border),
                    activeIcon: _buildActiveIcon(Icons.favorite),
                    label: "Favorites",
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outline),
                    activeIcon: _buildActiveIcon(Icons.person),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) => (),
      ),
    );
  }

  // Helper widget to draw the white circle around the selected icon
  Widget _buildActiveIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(
        AppSizes.p8,
      ), // Adjust padding to control circle size
      decoration: const BoxDecoration(
        color: AppColors.background, // White circle
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.primary, // Orange icon inside the circle
        size: AppSizes.iconMedium,
      ),
    );
  }
}
