import 'package:book_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class ItemNavigatorBar extends StatelessWidget {
  const ItemNavigatorBar({super.key, required this.selectedIndex, this.onTap});
  final int selectedIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(context.w(26), 0, context.w(26), context.h(16)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.17), // لون خلفية الـ bar
          borderRadius: BorderRadius.circular(context.w(40)), // البوردر الدائري
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home_outlined, size: context.sp(27)),
              activeIcon: Icon(Icons.home, size: context.sp(27)),
            ),
            BottomNavigationBarItem(
              label: 'favorit',
              icon: Icon(Icons.favorite_border, size: context.sp(27)),
              activeIcon: Icon(Icons.favorite, size: context.sp(27)),
            ),
            BottomNavigationBarItem(
              label: 'cart',
              icon: Icon(Icons.shopping_cart_outlined, size: context.sp(27)),
              activeIcon: Icon(Icons.shopping_cart, size: context.sp(27)),
            ),
          ],
        ),
      ),
    );
  }
}
