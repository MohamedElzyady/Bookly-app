import 'package:book_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Book Marks',
          style: TextStyle(fontSize: context.sp(30)),
        ),
      ),
    );
  }
}
