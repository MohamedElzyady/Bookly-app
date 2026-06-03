import 'package:book_app/features/book_marks/book_marks.dart';
import 'package:book_app/features/favorite/favorits.dart';
import 'package:book_app/features/home/presentation/views/widgets/home_body.dart';
import 'package:book_app/features/home/presentation/views/widgets/item_navigator_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  Widget _currentPage() {
    switch (_selectedIndex) {
      case 0:
        return const HomeBody();
      case 1:
        return const Favorits();
      case 2:
        return const BookMarks();
      default:
        return const HomeBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ItemNavigatorBar(
        selectedIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      body: _currentPage(),
    );
  }
}
