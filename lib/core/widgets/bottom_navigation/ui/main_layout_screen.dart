import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/cart/presentation/ui/cart_screen.dart';
import '../../../../features/cart/presentation/bloc/cart_cubit.dart';
import '../../../../features/cart/presentation/bloc/cart_state.dart';
import '../../../../features/home/presentation/ui/home_navigator.dart';
import '../../../theme/app_colors_light.dart';
import '../../../theme/app_sizes.dart';
import '../../menu/bloc/menu_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationCubit()),
        BlocProvider(create: (context) => MenuCubit()),
      ],
      child: BlocConsumer<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) => Scaffold(
          body: IndexedStack(
            index: BottomNavigationCubit.get(context).currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: SizedBox(
            height: AppSizes.bottomNavigationBarHeight,
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                // Calculate total quantity of items in cart
                int cartItemsCount = 0;
                if (cartState is CartLoaded) {
                  for (var item in cartState.items) {
                    cartItemsCount += item.quantity;
                  }
                }

                return BottomNavigationBar(
                  backgroundColor: AppColors.primary,
                  selectedItemColor: AppColors.background,
                  unselectedItemColor: AppColors.background,
                  currentIndex: BottomNavigationCubit.get(context).currentIndex,
                  onTap: BottomNavigationCubit.get(context).onPress,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  elevation: AppSizes.O,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home_outlined),
                      activeIcon: _buildActiveIcon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Badge(
                        isLabelVisible: cartItemsCount > 0,
                        label: Text(
                          '$cartItemsCount',
                          style: const TextStyle(color: AppColors.primary),
                        ),
                        backgroundColor: AppColors.background,
                        child: const Icon(Icons.shopping_cart_outlined),
                      ),
                      activeIcon: Badge(
                        isLabelVisible: cartItemsCount > 0,
                        label: Text(
                          '$cartItemsCount',
                          style: const TextStyle(color: AppColors.background),
                        ),
                        backgroundColor: AppColors.error,
                        child: _buildActiveIcon(Icons.shopping_cart),
                      ),
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
                );
              },
            ),
          ),
        ),
        listener: (context, state) => (),
      ),
    );
  }

  Widget _buildActiveIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(AppSizes.p4),
      decoration: const BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.primary, size: AppSizes.iconMedium),
    );
  }
}
