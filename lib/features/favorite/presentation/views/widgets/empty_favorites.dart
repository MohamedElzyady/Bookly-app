import 'package:book_app/core/utils/responsive_helper.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/constants.dart';
import 'package:flutter/material.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border_rounded,
              size: context.sp(62),
              color: secondaryColor,
            ),
            SizedBox(height: context.h(16)),
            Text('No bookmarked books yet', style: Style.textStyle18(context)),
            SizedBox(height: context.h(8)),
            Text(
              'When you press marker in Home, the book appears here.',
              style: Style.textStyle14(context).copyWith(color: secondaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
