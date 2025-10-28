import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'chat_list_screen.dart';
import 'profile.dart';
import 'favorites_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildTabButton(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 06, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.deepOrangeAccent.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 25,
                color: isSelected ? Colors.deepOrangeAccent : Colors.grey,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5,
                color: isSelected ? Colors.deepOrangeAccent : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _screens[_currentIndex],

      // 🧡 Floating Action Button in the center
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onTabSelected(2),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart, color: Colors.white, size: 28),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 🧭 Modern Bottom Navbar
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8, // space around FAB
          color: Colors.white,
          elevation: 10,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton(Icons.home, "Home", 0),
                _buildTabButton(Icons.favorite, "Fav", 1),
                const SizedBox(width: 40), // Space for FAB
                _buildTabButton(Icons.chat, "Chat", 3),
                _buildTabButton(Icons.person, "Profile", 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
