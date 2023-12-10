// screens/LoginScreen.dart

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/registration_screen.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:whistlingwoodz/widgets/input_field_widget.dart';
import 'package:whistlingwoodz/widgets/primary_button_signup.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/main.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.data});
  final bool data;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool newData = false;
  
 
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  
  Future signIn() async{
    showDialog(
      context: context,
      barrierDismissible: false,
      // ignore: prefer_const_constructors
      builder: (context) => Center(child: CircularProgressIndicator())
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim(),
        
        );
       
        // Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => const MyApp()),
        // )
        
    } on FirebaseAuthException catch (e){
      print(e);
    }
    
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    
    
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
                  onPressed: 
                    signIn
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const MyApp()),
                    // )
                    // if(widget.data){
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => Wedding(data:widget.data)),
                    //   );
                    // }
                    // else{
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => LoginScreen(data:widget.data)),
                    //   );
                    // }
                  
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
    //       return Wedding(data: widget.data);
    //     }
    //     else{
    //       debugPrint('failed to login');
    //       return const MyApp();
    //     }
    //   },
    // );

  
    
  }

  
}
