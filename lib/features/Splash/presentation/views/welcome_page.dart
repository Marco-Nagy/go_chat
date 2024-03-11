import 'package:flutter/material.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/constant.dart';
import 'package:go_chat/core/utils/img_assets.dart';
import 'package:go_chat/features/user/presentation/pages/LoginScreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text(
                "Welcome to Go Chat",
                style: TextStyle(
                    fontFamily: akaya,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: tabColor),
              ),
            ),
            Image.asset(ImgAssets.APP_LOGO,scale: .25,width: MediaQuery.sizeOf(context).width*.6,),
            Column(
              children: [
                const Text(
                  "Read our Privacy Policy Tap, 'Agree and Continue' to accept the Team of Service.",
                  textAlign: TextAlign.center,

                  style: TextStyle(fontSize: 15,color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "AGREE AND CONTINUE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
