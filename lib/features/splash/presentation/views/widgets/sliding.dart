import 'package:flutter/material.dart';

class Sliding extends StatelessWidget {
  const Sliding({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    // ! ده عشان نعمل اعاده بناء ل دي بس مش الصفحه كلها
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text('Read Free Books', textAlign: TextAlign.center),
        );
      },
    );
  }
}
