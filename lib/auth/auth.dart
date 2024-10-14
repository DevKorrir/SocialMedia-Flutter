import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/auth/login_or_register.dart';

import '../screens/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            //user is logged
            if (snapshot.hasData) {
              return const HomeScreen();
            }//usernot logged
            else {
              return const LoginOrRegister();
            }
          },
      ),
    );
  }
}
