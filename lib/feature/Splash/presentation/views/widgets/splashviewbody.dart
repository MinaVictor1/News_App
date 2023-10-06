import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/constant.dart';

import '../../../../../core/Utils/app_router.dart';
import 'slidingtext.dart';

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

    initslidinganimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(kSplashLogo),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initslidinganimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.to(homePage,
        //     transition: Transition.fade, duration: kTranstionDuration);

        GoRouter.of(context).push(Approute.kHomeview);
      },
    );
  }
}
