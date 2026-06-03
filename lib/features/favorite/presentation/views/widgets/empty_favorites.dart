import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/constants.dart';
import 'package:flutter/material.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bookmark_border_rounded,
              size: 62,
              color: secondaryColor,
            ),
            const SizedBox(height: 16),
            const Text('No bookmarked books yet', style: Style.textStyle18),
            const SizedBox(height: 8),
            Text(
              'When you press marker in Home, the book appears here.',
              style: Style.textStyle14.copyWith(color: secondaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
