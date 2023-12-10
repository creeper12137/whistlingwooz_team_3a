import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/screens/corporate_events_screen.dart';
import 'package:whistlingwoodz/screens/parties_screen.dart';
import 'package:whistlingwoodz/screens/services_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';
import 'package:whistlingwoodz/screens/photo_gallery_screen.dart';

// This class for the Bottom Navigation Bar widget
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  // The function of the bottom navigation bar to navigate to each tab
  // Future<void> navigationTapped(int index) async {
  void navigationTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Wedding(data: false)));
      // ScaffoldMessenger.of(context)
      //   ..removeCurrentSnackBar()
      //   ..showSnackBar(SnackBar(content: Text('$result')));
    } else if (_selectedIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Corporate()));
    } else if (_selectedIndex == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Party()));
    } else if (_selectedIndex == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Services()));
    } else if (_selectedIndex == 4) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MatchMaking()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Galleries()));
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
    );
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TabBar(
        controller: _tabController,
        labelColor: bottomNavigationColor,
        tabs: const [
          // Wedding tab
          Tab(
            icon: Icon(
              Icons.people_outlined,
            ),
            text: "W",
          ),
          // Corporate tab
          Tab(
            icon: Icon(
              Icons.add_business_outlined,
            ),
            text: "C",
          ),
          // Party tab
          Tab(
            icon: Icon(
              Icons.wine_bar_outlined,
            ),
            text: "P",
          ),
          // Service tab
          Tab(
            icon: Icon(
              Icons.room_service_outlined,
            ),
            text: "S",
          ),
          // Match Making tab
          Tab(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            text: "M",
          ),
          // Gallery tab
          Tab(
            icon: Icon(
              Icons.party_mode_outlined,
            ),
            text: "G",
          ),
        ],
        // event for the bottom navigation bar
        onTap: navigationTapped,
      ),
    );
  }
}
