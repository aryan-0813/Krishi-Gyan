import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sign_up.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Sign_up(),
      },
    );
  }
}
