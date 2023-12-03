import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesScreen extends StatelessWidget {
  final List<ServiceModel> services = [
    ServiceModel(
      title: "Understanding the Event Genre",
      imageUrl:"assets/simage1.png",
    ),
    ServiceModel(
      title: "Venue Design and Production",
      imageUrl:"assets/vimage2.png",
    ),
    ServiceModel(
      title: "Event Planning",
      imageUrl:"assets/evimage4.png",
    ),
    ServiceModel(
      title: "Entertainment & Performances",
      imageUrl:"assets/perimage5.png",
    ),
    ServiceModel(
      title: "Commute & Cabs",
      imageUrl:"assets/ccimage6.png",
    ),
    ServiceModel(
      title: "Vendors Range",
      imageUrl:"assets/venimage7.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }

  _launchURL() async {
    const url = 'https://whistlingwoodz.com.au/contact-us';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ServiceModel {
  final String title;
  final String imageUrl;

  ServiceModel({required this.title, required this.imageUrl});
}
