import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
// import 'package:whistlingwoodz/screens/registration_screen.dart';

// This class for the appbar widget
class AppBarPage extends StatefulWidget implements PreferredSizeWidget {
  const AppBarPage({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  // Function for the icon button to connect with whistlingwoodz homepage
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://whistlingwoodz.com.au');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function for the icon button to connect with registration page
  // void _registration() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const RegistrationScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        // When it has clicked, it goes previous screen.
        onPressed: () async => Navigator.of(context).pop(),
      ),
      actions: [
        // Notification button
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: appBackGroundColor,
          ),
          onPressed: () {},
        ),
        // Open whistlingwoodz homepage
        IconButton(
          icon: const Icon(
            Icons.home,
            color: appBackGroundColor,
          ),
          // link to the whistlingwoodz homepage
          onPressed: () {
            _launchURL();
          },
        ),
        // Logout button: It goes to the WhistlingWoodz Landing page
        IconButton(
          icon: const Icon(
            Icons.logout_outlined,
            color: appBackGroundColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LandingPage()),
            );
          },
        ),
      ],
    );
  }
}
