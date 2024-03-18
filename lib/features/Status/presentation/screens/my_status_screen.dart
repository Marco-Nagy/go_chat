import 'package:flutter/material.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/features/user/presentation/widgets/profile_widget.dart';
import 'package:get_time_ago/get_time_ago.dart';

class MyStatusScreen extends StatefulWidget {
  const MyStatusScreen({Key? key}) : super(key: key);

  @override
  _MyStatusScreenState createState() => _MyStatusScreenState();
}

class _MyStatusScreenState extends State<MyStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Status"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ProfileWidget(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      GetTimeAgo.parse(DateTime.now()
                          .subtract(Duration(seconds: DateTime.now().second))),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: greyColor,
                      size: 28,
                    ),
                    color: appBarColor,
                    iconSize: 28,
                    onSelected: (value) {},
                    itemBuilder: (context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: "Delete",
                        child: GestureDetector(
                            onTap: () {
                            },
                            child: const Text('Delete')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: greyColor.withOpacity(.4),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
