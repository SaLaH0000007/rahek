import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/cart/presentation/ui/cart_screen.dart';
import '../../theme/app_colors_light.dart';
import '../../../features/product_details/presentation/ui/product_details.dart';
import '../../../features/home/presentation/bloc/bottom_navigation_cubit.dart';
import '../../../features/home/presentation/bloc/bottom_navigation_state.dart';

class MainLayoutScreen extends StatelessWidget {
  MainLayoutScreen({super.key});

  final List<Widget> _screens = [
    ProductDetailsScreen(productId: 1),
    CartScreen(),
    Center(child: Text('Favorites Screen')),
    Center(child: Text('Profile Screen')),
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
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: BottomNavigationCubit.get(context).currentIndex,
              onTap: BottomNavigationCubit.get(context).onPress,
              backgroundColor: AppColors.background,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.textSecondary,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  activeIcon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
        listener: (context, state) => (),
      ),
    );
  }
}
