import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/commons/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //logout User
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          //logout button
          IconButton(
              onPressed: logout,
              icon: const Icon(Icons.logout)
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
