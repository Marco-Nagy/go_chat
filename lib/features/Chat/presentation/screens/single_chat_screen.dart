import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_chat/core/helpers/extentions.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/img_assets.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({Key? key}) : super(key: key);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
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
      body: Stack(
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
                    onLongPress: (){},
                    onSwipe: (){},
                  ),_messageWidget(
                    message: 'Wow Are you?',
                    alignment: Alignment.centerRight,
                    createAt: Timestamp.now(),
                    isShowTick: true,
                    isSeen: false,
                    messageBgColor: tabColor,
                    onLongPress: (){},
                    onSwipe: (){},
                  ),_messageWidget(
                    message: 'Hi',
                    alignment: Alignment.centerLeft,
                    createAt: Timestamp.now(),
                    isShowTick: true,
                    isSeen: false,
                    messageBgColor: senderMessageColor,
                    onLongPress: (){},
                    onSwipe: (){},
                  ),_messageWidget(
                    message: "I'm Fine :)",
                    alignment: Alignment.centerLeft,
                    createAt: Timestamp.now(),
                    isShowTick: true,
                    isSeen: false,
                    messageBgColor: senderMessageColor,
                    onLongPress: (){},
                    onSwipe: (){},
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }

  _messageWidget({
    Color? messageBgColor,
    Alignment? alignment,
    Timestamp? createAt,
    VoidCallback? onSwipe,
    double? rightPadding,
    String? message,
    bool? isShowTick,
    bool? isSeen,
    VoidCallback? onLongPress,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
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
}
