import 'package:flutter/material.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/features/user/presentation/widgets/profile_widget.dart';

class CallContactsScreen extends StatefulWidget {
  const CallContactsScreen({Key? key}) : super(key: key);

  @override
  _CallContactsScreenState createState() => _CallContactsScreenState();
}

class _CallContactsScreenState extends State<CallContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Contact"),),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                subtitle:  const Text("Hay There I'm using whatsapp"),
                trailing: Wrap(children: [
                  Icon(Icons.call,color: tabColor,size: 22,),
                  SizedBox(width: 15,),
                  Icon(Icons.video_call_rounded,color: tabColor,size: 25,),
                ],),

              ),

            ),
          ],
        ),
      ),
    );
  }
}
