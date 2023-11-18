import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/colors.dart';
import 'package:whistlingwoodz/screens/wedding_celebrations_screen.dart';
import 'package:whistlingwoodz/screens/corporate_events_screen.dart';
import 'package:whistlingwoodz/screens/parties_screen.dart';
import 'package:whistlingwoodz/screens/services_screen.dart';
import 'package:whistlingwoodz/screens/match_making_screen.dart';

class Galleries extends StatefulWidget {
  const Galleries({super.key});

  @override
  State<Galleries> createState() => _GalleriesState();
}

class _GalleriesState extends State<Galleries>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  void navigationTapped(int _selectedIndex) {
    if (_selectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Wedding()));
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
        () => setState(() => _selectedIndex = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: appBackGroundColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.star,
              color: appBackGroundColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              color: appBackGroundColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 139, 46, 43),
              Color(0xff510400),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/mandalaTop.png',
                  width: 300,
                ),
                const Text(
                  'This is the Gallery view',
                  style: TextStyle(
                    color: Color(0xffFFD700),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/mandala.png',
                  width: 700,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: TabBar(
          controller: _tabController,
          labelColor: bottomNavigationColor,
          tabs: [
            Tab(
              icon: Icon(
                _selectedIndex == 0 ? Icons.people : Icons.people_outlined,
              ),
              text: "W",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 1
                    ? Icons.add_business
                    : Icons.add_business_outlined,
              ),
              text: "C",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 2 ? Icons.wine_bar : Icons.wine_bar_outlined,
              ),
              text: "P",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 3
                    ? Icons.room_service
                    : Icons.room_service_outlined,
              ),
              text: "S",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 4
                    ? Icons.account_circle
                    : Icons.account_circle_outlined,
              ),
              text: "M",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 5
                    ? Icons.party_mode
                    : Icons.party_mode_outlined,
              ),
              text: "G",
            ),
          ],
          onTap: navigationTapped,
        ),
      ),
    );
  }
}
