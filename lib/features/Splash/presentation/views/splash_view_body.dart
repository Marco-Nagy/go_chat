// ignore_for_file: use_build_context_synchronously
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_chat/core/utils/constant.dart';
import 'package:go_chat/core/utils/img_assets.dart';
import 'package:go_chat/features/Splash/presentation/views/welcome_page.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController lottieController;
  late AnimationController logoController;

  late Animation<Offset> slideAnimation;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    lottieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          ImgAssets.APP_SPLASH,
          controller: lottieController,
          height: MediaQuery.of(context).size.height * .4,
          animate: true,
          onLoaded: (composition) {
            lottieController.duration = composition.duration;
            lottieController.forward().whenComplete(() {});
          },
        ),
        AnimatedBuilder(
          animation: slideAnimation,
          builder: (_, child) => SlideTransition(
            position: slideAnimation,
            child: Image.asset(
              ImgAssets.APP_LOGO,
            ),
          ),
        ),
        if (isLoaded == true)
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: akaya,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Connecting the World, One Chat at a Time!',
                      speed: const Duration(milliseconds: 100),
                      textAlign: TextAlign.center),
                ],
                totalRepeatCount: 1,
                onFinished: () async {
                  await Future.delayed(kTransitionDuration);
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const WelcomePage(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  void initAnimation() async {
    lottieController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    logoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true,period:const Duration(seconds: 1) );
    slideAnimation = Tween(  begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: logoController,
      curve: Curves.linearToEaseOut,
    ));
    lottieController.addListener(() {
      setState(() {
        if (lottieController.isAnimating) {
          logoController.forward();
        }
      });
    });
    logoController.addListener(() {
      if (logoController.isAnimating) {
        setState(() {
          isLoaded = true;
        });
      }
    });
  }
}
