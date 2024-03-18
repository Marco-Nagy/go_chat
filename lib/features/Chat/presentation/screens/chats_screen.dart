import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_chat/core/helpers/extentions.dart';
import 'package:go_chat/core/routes/app_route.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/features/user/presentation/widgets/profile_widget.dart';
import 'package:intl/intl.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            context.pushNamed(AppRouter.singleChatScreen);
          },

          child: ListTile(
            leading:  SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: ProfileWidget(
                    ))),
            title: const Text(
              'User Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'last message hi',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            trailing:  Text(
              DateFormat.jm().format(DateTime.now()),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 13, color: greyColor),
            ),
          ),
        ),

      ),
    );
  }
}
