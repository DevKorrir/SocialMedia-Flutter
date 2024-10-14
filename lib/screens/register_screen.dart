import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/commons/my_button.dart';

import '../commons/my_textField.dart';
import '../helper/help_functions.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;

  const RegisterScreen({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpwController = TextEditingController();

  //register method
  Future<void> registerUser() async {
    //show loading
    showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator()
        )
    );

    //make sure password match
    if(passwordController.text != confirmpwController.text) {
      //po loading progress
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser("Password don't match!",context);
    } else {//if password dont match
      //try creating the user
      try{
        //create the user
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        //pop loading
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading
        Navigator.pop(context);

        //display error message to user
        displayMessageToUser(e.code, context);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25,),

                //app name
                const Text(
                  "AldoHub",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox( height: 25,),


                //username textfield
                MyTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernameController,
                ),

                const SizedBox(height: 10,),

                //email textfield
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                ),

                const SizedBox(height: 10,),

                //password textfield
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 10,),

                //confirmpassword textfield
                MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmpwController,
                ),

                const SizedBox(height: 10,),

                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 25,),

                //register i button
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),

                const SizedBox(height: 25,),

                //don't have an account text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),


        )
    );
  }
}
