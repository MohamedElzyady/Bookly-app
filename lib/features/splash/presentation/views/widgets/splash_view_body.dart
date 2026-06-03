import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/features/splash/presentation/views/widgets/sliding.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).pushReplacement('/home');
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.logo),
        Gap(4),
        Sliding(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
