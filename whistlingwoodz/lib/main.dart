import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/main_screen.dart';
import 'package:whistlingwoodz/models/wedding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    title: 'Whistlingwoodz',
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home: const MyApp(selectedIndex: 7),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int newIndex = 0;

  void navigationTapped(int selectedIndex) {
    debugPrint("navigationTapped: $selectedIndex");
    setState(() {
      newIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    navigationTapped(widget.selectedIndex);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainScreen(data: true, selectedIndex: newIndex);
        } else {
          return MainScreen(data: false, selectedIndex: newIndex);
        }
      },
    );
  }
}
