import 'package:flutter/material.dart';
import 'package:go_chat/features/user/presentation/widgets/profile_widget.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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

                ),

              ),
          ],
        ),
      ),
    );
  }
}
