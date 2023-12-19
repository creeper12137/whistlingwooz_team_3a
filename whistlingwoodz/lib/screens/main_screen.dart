import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/screens/corporate_events_screen.dart';
import 'package:whistlingwoodz/screens/parties_screen.dart';
import 'package:whistlingwoodz/screens/services_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';
import 'package:whistlingwoodz/screens/photo_gallery_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(
      {super.key, required this.data, required this.selectedIndex});
  final bool data;
  final int selectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    currentPage() {
      if (widget.selectedIndex == 0) {
        return const Wedding();
      } else if (widget.selectedIndex == 1) {
        return const Corporate();
      } else if (widget.selectedIndex == 2) {
        return const Party();
      }
      else if (widget.selectedIndex == 3) {
        return const Services();
      }
      else if (widget.selectedIndex == 4) {
        return const MatchMaking();
      }
      else if (widget.selectedIndex == 5) {
        return const Galleries();
      }
      else if (widget.selectedIndex == 7) {
        return const LandingPage();
      }
       else {
        return const Wedding();
      }
    }

    return Scaffold(
      appBar: AppBarPage(data: widget.data),
      body: currentPage(),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
