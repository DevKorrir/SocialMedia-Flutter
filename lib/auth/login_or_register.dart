import 'package:flutter/cupertino.dart';
import 'package:socialmedia/screens/login_screen.dart';
import 'package:socialmedia/screens/register_screen.dart';

import '../main.dart';


// void main() {
//   runApp(const MyApp());
// }

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show a login page
  bool showLoginScreen = true;

  //toggle between login and register screen
  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(
        onTap: toggleScreens,
      );
    }else{
      return RegisterScreen(onTap: toggleScreens);
    }
  }
}
