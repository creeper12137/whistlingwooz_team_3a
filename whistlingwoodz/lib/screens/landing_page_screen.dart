import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlingwoodz/screens/login_screen.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Function for the icon button to connect with whistlingwoodz homepage
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://whistlingwoodz.com.au');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to connect with registration page
  void _registration() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarPage(),
      appBar: AppBar(
        // backgroundColor: Colors.transparent, // if this code is used, the appbar will be transparent as white.
        backgroundColor: Colors.amberAccent, //withOpacity(0.50), // optional
        elevation: 0,
        // leading: const Icon(Icons.menu),
        actions: [
          // Open whistlingwoodz homepage
          IconButton(
            icon: const Icon(
              Icons.home,
            ),
            color: appBackGroundColor,
            // link to the whistlingwoodz homepage
            onPressed: () {
              _launchURL();
            },
          ),
          // Open registration page
          IconButton(
            icon: const Icon(
              Icons.login,
              color: appBackGroundColor,
            ),
            // link to the registration page
            onPressed: () {
              _registration();
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // backgound photo for landing page
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            opacity: 0.8,
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 165,
                    ),
                    Text(
                      'WEDDINGS',
                      style: TextStyle(
                        color: Colors.white,
                        // color: Color(0xffFFD700),
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'CORPORATE EVENTS',
                      style: TextStyle(
                        color: Colors.white,
                        // color: Color(0xffFFD700),
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'AND LIVE CONCERTS',
                      style: TextStyle(
                        color: Colors.white,
                        // color: Color(0xffFFD700),
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'WHISTLINGWOODZ',
                      style: TextStyle(
                        color: Colors.white,
                        // color: Color(0xffFFD700),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        // fontFamily: 'Bailleul',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  // Widget tabContainer(BuildContext con, Color tabColor, String tabText) {
  //   return Container(
  //     width: MediaQuery.of(con).size.width,
  //     height: MediaQuery.of(con).size.height,
  //     color: tabColor,
  //     child: Center(
  //       child: Text(
  //         tabText,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontSize: 24,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
