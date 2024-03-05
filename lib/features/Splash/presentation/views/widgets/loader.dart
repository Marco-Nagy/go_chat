import 'package:flutter/material.dart';
import 'package:go_chat/core/utils/img_assets.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            ImgAssets.APP_SPLASH,
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height * .05,
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }
}
