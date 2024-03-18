import 'package:flutter/material.dart';
import 'package:go_chat/core/routes/app_route.dart';
import 'package:go_chat/features/Call/presentation/pages/call_contacts_screen.dart';
import 'package:go_chat/features/Chat/presentation/screens/single_chat_screen.dart';
import 'package:go_chat/features/Home/presentation/screens/contacts_screen.dart';
import 'package:go_chat/features/Home/presentation/screens/home_screen.dart';
import 'package:go_chat/features/Settings/settings_screen.dart';
import 'package:go_chat/features/Status/presentation/screens/my_status_screen.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    switch (name) {
      case AppRouter.homeScreen:
        return materialScreenBuilder(const HomeScreen());
      case AppRouter.contactUsersScreen:
        return materialScreenBuilder(const ContactsScreen());
      case AppRouter.settingsScreen:
        return materialScreenBuilder(const SettingsScreen());
      case AppRouter.myStatusScreen:
        return materialScreenBuilder(const MyStatusScreen());
        case AppRouter.callContactsScreen:
        return materialScreenBuilder(const CallContactsScreen()); 
        case AppRouter.singleChatScreen:
        return materialScreenBuilder(const SingleChatScreen());
    }
  }


}
materialScreenBuilder(Widget child) => MaterialPageRoute(
  builder: (context) => child,
);