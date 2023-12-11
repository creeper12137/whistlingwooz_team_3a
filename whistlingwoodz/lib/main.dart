import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';



void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp(
    
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyApp(),
    )
    );
 
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context)  {  
    MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Wedding(data: false),
    );

   return  StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return const Wedding(data: true);
        }
        else{
          return const Wedding(data: false);
        }
      },
    );
  }
  
 
}

