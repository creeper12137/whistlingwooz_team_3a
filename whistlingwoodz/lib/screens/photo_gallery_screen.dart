import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';

class Galleries extends StatefulWidget {
  const Galleries({super.key});

  @override
  State<Galleries> createState() => _GalleriesState();
}

class _GalleriesState extends State<Galleries> {
  final List<ServiceModel> photos = [
    ServiceModel(
      imageUrl: "assets/images/weddingPage.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/corporatePage.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/partyPage.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/twohearts.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place1.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place2.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place3.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place4.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place5.png",
    ),
    ServiceModel(
      imageUrl: "assets/images/photoGallery_place6.png",
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
        itemCount: photos.length,
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
                      photos[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://whistlingwoodz.com.au/photo-gallery');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ServiceModel {
  final String imageUrl;
  ServiceModel({required this.imageUrl});
}
