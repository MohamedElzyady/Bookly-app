import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.mainAxisAlignment});
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color.fromARGB(255, 247, 255, 7),
        ),
        Gap(4),
        const Text('4.8', style: Style.textStyle16),
        Text(
          ' (2.390)',
          style: Style.textStyle14.copyWith(
            color: secondaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
