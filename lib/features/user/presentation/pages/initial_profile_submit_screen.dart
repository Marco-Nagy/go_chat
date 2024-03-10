import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/constant.dart';
import 'package:go_chat/core/utils/message_type_const.dart';
import 'package:go_chat/core/widgets/toast.dart';
import 'package:go_chat/features/user/presentation/widgets/profile_widget.dart';
import 'package:image_picker/image_picker.dart';


class InitialProfileSubmitScreen extends StatefulWidget {
  const InitialProfileSubmitScreen({Key? key}) : super(key: key);

  @override
  _InitialProfileSubmitScreenState createState() =>
      _InitialProfileSubmitScreenState();
}

class _InitialProfileSubmitScreenState extends State<InitialProfileSubmitScreen>
    with SingleTickerProviderStateMixin {
   File _image = File('');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      "Profile Info",
                      style: TextStyle(
                          fontFamily: akaya,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: tabColor),
                    ),
                  ),
                  const Text(
                    "Please provide your name and an optional profile photo the further steps to complete)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: selectImage,
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: ProfileWidget(
                              image: _image,
                            ))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const OtpScreen()));
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

  Future selectImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          // aweSnackBar(
          //     msg: 'No Image has been selected',
          //     context: context,
          //     title: 'Warning',
          //     type: MessageTypeConst.warning);
        }
      });
    } catch (e) {
      print('Error $e');
      aweSnackBar(
          msg: 'Error $e',
          context: context,
          title: 'Error',
          type: MessageTypeConst.failure);
    }
  }
}
