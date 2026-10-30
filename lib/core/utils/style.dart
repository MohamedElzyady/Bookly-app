import 'package:book_app/core/utils/responsive_helper.dart';
import 'package:flutter/widgets.dart';

abstract class Style {
  static TextStyle textStyle18(BuildContext context) => TextStyle(
    fontSize: context.sp(18),
    fontWeight: FontWeight.w600,
  );

  static TextStyle textStyle20(BuildContext context) => TextStyle(
    fontSize: context.sp(20),
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyle14(BuildContext context) => TextStyle(
    fontSize: context.sp(14),
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyle16(BuildContext context) => TextStyle(
    fontSize: context.sp(16),
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle30(BuildContext context) => TextStyle(
    fontSize: context.sp(30),
    fontWeight: FontWeight.w600,
    fontFamily: 'GT Sectra',
  );
}
