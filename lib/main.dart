import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_chat/features/Splash/presentation/views/splash_view.dart';
import 'package:oktoast/oktoast.dart';

import 'core/routes/on_generate_route.dart';
import 'core/theme/styes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: tabColor,
              brightness: Brightness.dark
          ),
          scaffoldBackgroundColor: backgroundColor,
          dialogBackgroundColor: appBarColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
        routes: {"/":(context)=>const SplashView()},
      ),
    );
  }
}

