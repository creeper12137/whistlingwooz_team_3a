import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/screens/admin/dashboard_screen.dart';
import 'package:whistlingwoodz/screens/admin/inquiries_screen.dart';
import 'package:whistlingwoodz/screens/admin/setting_screen.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.home,
              color: appBackGroundColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ),
              );
            },
          ),
          title: const Text(
            'Admin Panel',
            style: TextStyle(color: appBackGroundColor),
          ),
          titleSpacing: 0,
          backgroundColor: Colors.amberAccent,
          toolbarHeight: MediaQuery.of(context).size.width * 0.20,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: appBackGroundColor,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            labelColor: appBackGroundColor,
            unselectedLabelColor: Colors.white,
            indicator: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            onTap: onTabTapped,
            tabs: [
              Tab(
                icon: Icon(
                  _selectedIndex == 0
                      ? Icons.dashboard
                      : Icons.dashboard_outlined,
                  color:
                      _selectedIndex == 0 ? appBackGroundColor : Colors.white,
                ),
                text: "Dashboard",
              ),
              Tab(
                icon: Icon(
                  _selectedIndex == 1
                      ? Icons.question_answer
                      : Icons.question_answer_outlined,
                  color:
                      _selectedIndex == 1 ? appBackGroundColor : Colors.white,
                ),
                text: "Inquiry",
              ),
              Tab(
                icon: Icon(
                  _selectedIndex == 2
                      ? Icons.settings
                      : Icons.settings_outlined,
                  color:
                      _selectedIndex == 2 ? appBackGroundColor : Colors.white,
                ),
                text: "Setting",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            DashboardPage(),
            InquiryList(),
            AdminSetting(),
          ],
        ),
      ),
    );
  }
}
