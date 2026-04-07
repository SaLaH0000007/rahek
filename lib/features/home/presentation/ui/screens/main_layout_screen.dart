import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../product_details/presentation/ui/product_details.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  // دي لستة الشاشات اللي هتتعرض حسب التاب اللي اليوزر اختاره
  final List<Widget> _screens = [
    ProductDetailsScreen(), // مؤقتاً هنحطها هي الرئيسية عشان تشوفها
    Center(child: Text('Cart Screen')),
     Center(child: Text('Favorites Screen')),
     Center(child: Text('Profile Screen')),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // الـ IndexedStack بيحفظ حالة الشاشات عشان لما تتنقل بينهم البيانات متمسحش
      body: IndexedStack(index: _currentIndex, children: _screens),
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
          currentIndex: _currentIndex,
          onTap: _onTap,
          backgroundColor: AppColors.background,
          type: BottomNavigationBarType.fixed, // مهم لو عندك أكتر من 3 تابات
          selectedItemColor: AppColors.primary, // اللون لما التاب يكون متحدد
          unselectedItemColor: AppColors.textSecondary, // اللون العادي
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
    );
  }
}
