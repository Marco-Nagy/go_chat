import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_chat/core/helpers/extentions.dart';
import 'package:go_chat/core/routes/app_route.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/date_formats.dart';
import 'package:go_chat/features/user/presentation/widgets/profile_widget.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ProfileWidget())),
                    Positioned(
                      right: 10,
                      bottom: 8,
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: tabColor,
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(color: backgroundColor, width: 2)),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            size: 20,
                          ))),
                    )
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My status',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'Tapto add You Status Update',
                      style: TextStyle(color: greyColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),),


                GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRouter.myStatusScreen);
                    },
                    child: const Icon(Icons.more_horiz)),
                const SizedBox(
                  width: 10,
                ),

              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Recent Update',
                style: TextStyle(fontSize: 15,color: greyColor, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => ListTile(
                leading:  Container(
                  margin: const EdgeInsets.all(3),
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ProfileWidget(
                        ))),
                title: const Text(
                  'User Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle:  Text(formatDateTime(DateTime.now()),

                ),

              ),

            ),
          ],
        ),
      ),
    );
  }
}
