import 'package:flutter/material.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/date_formats.dart';
import 'package:go_chat/features/user/presentation/widgets/profile_widget.dart';
import 'package:intl/intl.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Recent ',
                style: TextStyle(fontSize: 15,color: greyColor, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => ListTile(
                leading:  SizedBox(
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ProfileWidget(
                        ))),
                title: Text(
                  'User Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.call_made,size: 19,color: Colors.green,),
                     SizedBox(width: 10,),
                     Text(
                      formatDateTime(DateTime.now()),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 13, color: greyColor),
                    ),
                  ],
                ),
                trailing:   Icon(Icons.call,size: 19,color: tabColor,),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
