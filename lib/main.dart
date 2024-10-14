import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/auth/auth.dart';
import 'package:socialmedia/auth/login_or_register.dart';
import 'package:socialmedia/screens/login_screen.dart';
import 'package:socialmedia/screens/register_screen.dart';
import 'package:socialmedia/theme/dark_mode.dart';
import 'package:socialmedia/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBM2Bxo8fj839Sx-49rjq3ftdCKJCPuCTI",
        appId: "1:940710387561:android:83f8f85174be19c33de7f8",
        messagingSenderId: "940710387561",
        projectId: "crudtutorial-567fe",
        storageBucket: "crudtutorial-567fe.appspot.com",
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
