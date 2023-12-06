// screens/LoginScreen.dart

import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/registration_screen.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:whistlingwoodz/widgets/input_field_widget.dart';
import 'package:whistlingwoodz/widgets/primary_button_signup.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  
 
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(), 
      password: passwordController.text.trim()
      );
  }
  @override
  Widget build(BuildContext context) {
     

  return Scaffold(
      // Fix for pixel exceeding screen.
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child:  Column(
              children:[
                // ignore: prefer_const_constructors
                SizedBox(height: 40),
                TextField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 4),
                TextField(
                  controller: passwordController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                // ignore: prefer_const_constructors
                SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    // ignore: prefer_const_constructors
                    minimumSize: Size.fromHeight(50),
                  ),
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.lock, size: 32),
                  // ignore: prefer_const_constructors
                  label:Text(
                    'Sign In',
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed:signIn, 
                )
              ]
             
            
          ),
        ),
      ),
    );

    // return StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot){
    //     if(snapshot.hasData){
    //       debugPrint('successful login');
    //       return const LandingPage();
    //     }
    //     else{
    //       debugPrint('failed to login');
    //       return const LoginScreen();
    //     }
    //   },
    // );

  
    
  }

  
}
