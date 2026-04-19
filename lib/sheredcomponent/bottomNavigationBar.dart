import 'package:flutter/material.dart';
import '../features/home/presentation/ui/home_page.dart';
import '../features/cart/presentation/ui/cart_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HoneyPage(),
    CartPage(),
    Center(child: Text("Favorites")),
    Center(child: Text("Profile")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _selectedIndex == index
            ? Colors.white24
            : Colors.transparent,
      ),
      padding: EdgeInsets.all(8),
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE2A331),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // مهم 👈

        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.shopping_cart, 1),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite, 2),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 3),
            label: "",
          ),
        ],
      ),
    );
  }
}