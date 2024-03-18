import 'package:flutter/material.dart';
import 'package:go_chat/core/helpers/extentions.dart';
import 'package:go_chat/core/routes/app_route.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/message_type_const.dart';
import 'package:go_chat/core/widgets/snack_bar.dart';
import 'package:go_chat/features/Call/presentation/pages/calls_screen.dart';
import 'package:go_chat/features/Chat/presentation/screens/chats_screen.dart';
import 'package:go_chat/features/Status/presentation/screens/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabCurrentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _tabCurrentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Go Chat",
          style: TextStyle(
              fontSize: 20, color: greyColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: greyColor,
                size: 28,
              ),
              const SizedBox(
                width: 25,
              ),
              const Icon(Icons.search, color: greyColor, size: 28),
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
                    value: "Settings",
                    child: GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.settingsScreen);
                        },
                        child: const Text('Settings')),
                  ),
                ],
              ),
            ],
          ),
        ],
        bottom: TabBar(
            labelColor: tabColor,
            unselectedLabelColor: greyColor,
            indicatorColor: tabColor,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text(
                  'Chats',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  'Status',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  'Calls',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsScreen(),
          StatusScreen(),
         CallsScreen(),
        ],
      ),
      floatingActionButton:
          switchFloatingActionButtonIndex(_tabCurrentTabIndex),
    );
  }

  switchFloatingActionButtonIndex(int tabCurrentTabIndex) {
    switch (tabCurrentTabIndex) {
      case 0:
        return FloatingActionButton(
          backgroundColor: tabColor,
          onPressed: () {
            context.pushNamed(AppRouter.contactUsersScreen);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsScreen(),));
          },
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        );
      case 1:
        return FloatingActionButton(
          backgroundColor: tabColor,
          onPressed: () {
          context.pushNamed(AppRouter.callContactsScreen);
          },
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        );
      case 2:
        return FloatingActionButton(
          backgroundColor: tabColor,
          onPressed: () {
            aweSnackBar(
                msg: 'warning ',
                context: context,
                title: 'Status',
                type: MessageTypeConst.warning);
          },
          child: const Icon(
            Icons.add_call,
            color: Colors.white,
          ),
        );
      default:FloatingActionButton(
        backgroundColor: tabColor,
        onPressed: () {},
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      );
    }
  }
}
