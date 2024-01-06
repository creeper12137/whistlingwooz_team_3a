import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/screens/corporate_events_screen.dart';
import 'package:whistlingwoodz/screens/parties_screen.dart';
import 'package:whistlingwoodz/screens/services_screen.dart';
import 'package:whistlingwoodz/screens/survey_form_screen.dart';
import 'package:whistlingwoodz/screens/photo_gallery_screen.dart';
import 'package:whistlingwoodz/screens/inquiry_form_screen.dart';
import 'package:whistlingwoodz/screens/registration_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.data,
    required this.selectedIndex,
    required this.onSubmit,
  }) : super(key: key);

  final bool data;
  final int selectedIndex;
  final void Function() onSubmit;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    Widget currentPage() {
      // Your existing logic...

      // Assuming you want to call the onSubmit function when selectedIndex is 9
      if (widget.selectedIndex == 9) {
        widget.onSubmit(); // Call the onSubmit function
     return RegistrationScreen(showLoginPage: () {}, data: false);


      // Add other conditions for different pages...

      return Container(); // Default return if none of the conditions match
    }

    return Scaffold(
      appBar: AppBarPage(data: widget.data),
      body: currentPage(),
      bottomNavigationBar: const BottomBar(),
    );
  }
}


