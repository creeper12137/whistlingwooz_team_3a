import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';
import 'package:whistlingwoodz/screens/inquiry_form_screen.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final List<ServiceModel> services = [
    ServiceModel(
      title: "Understanding the Event Genre",
      imageUrl: "assets/images/simage1.png",
    ),
    ServiceModel(
      title: "Venue Design and Production",
      imageUrl: "assets/images/vimage2.png",
    ),
    ServiceModel(
      title: "Event Planning",
      imageUrl: "assets/images/evimage4.png",
    ),
    ServiceModel(
      title: "Entertainment & Performances",
      imageUrl: "assets/images/perimage5.png",
    ),
    ServiceModel(
      title: "Commute & Cabs",
      imageUrl: "assets/images/ccimage6.png",
    ),
    ServiceModel(
      title: "Vendors Range",
      imageUrl: "assets/images/venimage7.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(data: false),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launchURL();
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      services[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      services[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: buildNavigationButton(),
      bottomNavigationBar: const BottomBar(),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://whistlingwoodz.com.au/contact-us');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Floating Action Button for navigation to the inquiry form
  Widget buildNavigationButton() => FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InquiryForm(),
            ),
          );
        },
        backgroundColor: Colors.yellow[900],
        shape: const CircleBorder(),
        child: const Icon(
          Icons.mode_edit,
          color: Colors.white,
        ),
      );
}

class ServiceModel {
  final String title;
  final String imageUrl;

  ServiceModel({required this.title, required this.imageUrl});
}
