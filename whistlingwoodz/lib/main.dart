import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyApp(),
    )
    );
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context)  {  
 

    return  StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          debugPrint('successful logged in');
          return const LandingPage();
        }
        else{
          debugPrint('Invalid username or password');
          return const LoginScreen();
        }
      },
    );

    
  }
  
 
}

