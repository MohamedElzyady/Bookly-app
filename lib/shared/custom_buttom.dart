import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.backgroundcolor,
    required this.textColor,
    this.borderRadius, required this.text,  this.onPressed,
  });
  final Color backgroundcolor;
  final String text;
  final Color textColor;
  final BorderRadius? borderRadius;
  final Function()?onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Style.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
