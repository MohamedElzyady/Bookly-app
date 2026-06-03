import 'package:flutter/material.dart';

class ItemNavigatorBar extends StatelessWidget {
  const ItemNavigatorBar({super.key, required this.selectedIndex, this.onTap});
  final int selectedIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 26, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.17), // لون خلفية الـ bar
          borderRadius: BorderRadius.circular(40), // البوردر الدائري
          boxShadow: [
            // ظل عشان تأثير الطفو
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.19),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5), // اتجاه الظل لتحت
            ),
          ],
        ),
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: selectedIndex,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'home',
              icon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(Icons.home_outlined, size: 27),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(Icons.home, size: 27),
              ),
            ),
            BottomNavigationBarItem(
              label: 'favorit',
              icon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(Icons.favorite_border, size: 27),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(Icons.favorite, size: 27),
              ),
            ),
            BottomNavigationBarItem(
              label: 'cart',
              icon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(Icons.shopping_cart_outlined, size: 27),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(Icons.shopping_cart, size: 27),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
