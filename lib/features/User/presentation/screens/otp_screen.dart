import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/constant.dart';
import 'initial_profile_submit_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      "Verify Your OTP",
                      style: TextStyle(
                          fontFamily: akaya,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: tabColor),
                    ),
                  ),
                  const Text(
                    "Enter your OTP for the Go Chat Verification (so that you will be moved for the further steps to complete)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _pinCodeWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InitialProfileSubmitScreen()));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  color: tabColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pinCodeWidget() {
    return Column(
      children: [
        PinCodeFields(
          animationCurve: Curves.easeInExpo,
          margin: const EdgeInsets.all(5),
          switchInAnimationCurve: Curves.easeInCirc,
          responsive: true,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          keyboardType: TextInputType.number,
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
          length: 6,
          activeBorderColor: tabColor,
          controller: _otpController,
          onComplete: (value) {},
        ),
        const Text(
          "Enter your 6 digits code",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
