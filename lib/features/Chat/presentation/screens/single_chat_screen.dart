import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_chat/core/helpers/extentions.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/img_assets.dart';
import 'package:intl/intl.dart';
import 'package:spring/spring.dart';
import 'package:swipe_to/swipe_to.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({Key? key}) : super(key: key);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  final TextEditingController _textMessageController = TextEditingController();
   SpringController springController = SpringController();
  bool _isDisplaySendButton = false;
  bool? _isShowAttachWindow;

  @override
  void dispose() {
    _textMessageController.dispose();
    super.dispose();
  }
@override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('User Name'),
            Text(
              'online',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.videocam_rounded,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.call,
            size: 22,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.more_vert,
            size: 22,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isShowAttachWindow = false;
            // springController.play(motion: Motion.pause);
          });
        },
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  ImgAssets.WHATSAPP_BG_IMAGE,
                  fit: BoxFit.cover,
                )),
            Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    _messageWidget(
                      message: 'Hello',
                      alignment: Alignment.centerRight,
                      createAt: Timestamp.now(),
                      isShowTick: true,
                      isSeen: false,
                      messageBgColor: tabColor,
                      onLongPress: () {},
                      onSwipe: () {},
                    ),
                    _messageWidget(
                      message: 'Wow Are you?',
                      alignment: Alignment.centerRight,
                      createAt: Timestamp.now(),
                      isShowTick: true,
                      isSeen: false,
                      messageBgColor: tabColor,
                      onLongPress: () {},
                      onSwipe: () {},
                    ),
                    _messageWidget(
                      message: 'Hi',
                      alignment: Alignment.centerLeft,
                      createAt: Timestamp.now(),
                      isShowTick: true,
                      isSeen: false,
                      messageBgColor: senderMessageColor,
                      onLongPress: () {},
                      onSwipe: () {},
                    ),
                    _messageWidget(
                      message: "I'm Fine :)",
                      alignment: Alignment.centerLeft,
                      createAt: Timestamp.now(),
                      isShowTick: true,
                      isSeen: false,
                      messageBgColor: senderMessageColor,
                      onLongPress: () {},
                      onSwipe: () {},
                    ),
                  ],
                )),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: appBarColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isShowAttachWindow = false;
                              });
                            },
                            child: TextField(
                              controller: _textMessageController,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _isDisplaySendButton = true;
                                  });
                                } else {
                                  setState(() {
                                    _isDisplaySendButton = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                prefixIcon: Icon(
                                  Icons.emoji_emotions,
                                  color: greyColor,
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Wrap(
                                    children: [
                                      Transform.rotate(
                                        angle: -.6,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if(_isShowAttachWindow != true ) {
                                                _isShowAttachWindow =true;
                                              }else{
                                                _isShowAttachWindow =
                                               false;
                                              }
                                              // springController.play(
                                              //     motion: Motion.play,
                                              //     curve: Curves.easeInOut);
                                            });
                                          },
                                          child: Icon(
                                            Icons.attach_file,
                                            color: greyColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(
                                        Icons.camera_alt,
                                        color: greyColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: 'Message',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: tabColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Icon(
                            _isDisplaySendButton
                                ? Icons.send_outlined
                                : Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

               if(_isShowAttachWindow!=null ) ...{Positioned(
                    bottom: 65,
                    top: 340,
                    right: 20,
                    left: 20,
                    child:_isShowAttachWindow! ? Spring.scale(
                      animDuration: Duration(seconds: 1),
                      start: 0,
                      end: 1,
                      springController: springController,
                      child: _attachWindow(),
                    ):Spring.scale(
                      start: 1,
                      end:0,
                      animDuration: Duration(milliseconds: 100),
                      springController: springController,
                      child: _attachWindow(),
                    ),
                  )},
          ],
        ),
      ),
    );
  }

  _messageWidget({
    Color? messageBgColor,
    Alignment? alignment,
    Timestamp? createAt,
    VoidCallback? onSwipe,
    String? message,
    bool? isShowTick,
    bool? isSeen,
    VoidCallback? onLongPress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SwipeTo(
          onRightSwipe: (details) => onSwipe,
          child: InkWell(
            onLongPress: onLongPress,
            child: Container(
              alignment: alignment,
              child: Stack(children: [
                Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: context.width * 0.80),
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(left: 5, right: 85,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: messageBgColor,
                      ),
                      child: Text(
                        '$message',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(DateFormat.jm().format(createAt!.toDate()),
                          style: const TextStyle(fontSize: 12, color: lightGreyColor)),
                      const SizedBox(
                        width: 5,
                      ),
                      isShowTick == true
                          ? Icon(
                              isSeen == true ? Icons.done_all : Icons.done,
                              size: 16,
                              color: isSeen == true ? Colors.blue : greyColor,
                            )
                          : Container()
                    ],
                  ),
                ),
              ]),
            ),
          )),
    );
  }
  _attachWindow() {
    return Container(
      width: double.infinity,
      height: context.height * 0.20,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bottomAttachContainerColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _attachWindowItem(
                icon: Icons.document_scanner,
                color: Colors.deepPurpleAccent,
                title: "Document",
              ),
              _attachWindowItem(
                  icon: Icons.camera_alt,
                  color: Colors.pinkAccent,
                  title: "Camera",
                  onTap: () {}),
              _attachWindowItem(
                  icon: Icons.image,
                  color: Colors.purpleAccent,
                  title: "Gallery"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _attachWindowItem(
                  icon: Icons.headphones,
                  color: Colors.deepOrange,
                  title: "Audio"),
              _attachWindowItem(
                  icon: Icons.location_on,
                  color: Colors.green,
                  title: "Location"),
              _attachWindowItem(
                  icon: Icons.account_circle,
                  color: Colors.deepPurpleAccent,
                  title: "Contact"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _attachWindowItem(
                icon: Icons.bar_chart,
                color: tabColor,
                title: "Poll",
              ),
              _attachWindowItem(
                  icon: Icons.gif_box_outlined,
                  color: Colors.indigoAccent,
                  title: "Gif",
                  onTap: () {}),
              _attachWindowItem(
                  icon: Icons.videocam_rounded,
                  color: Colors.lightGreen,
                  title: "Video",
                  onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
  _attachWindowItem({
    IconData? icon,
    Color? color,
    String? title,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Icon(
                icon,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$title',
          style: const TextStyle(fontSize: 13, color: greyColor),
        ),
      ],
    );
  }


}

