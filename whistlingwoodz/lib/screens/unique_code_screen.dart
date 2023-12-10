import 'package:flutter/material.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';

class UniqueCodeForm extends StatefulWidget {
  const UniqueCodeForm({super.key});

  @override
  State<UniqueCodeForm> createState() => _UniqueCodeFormState();
}

class _UniqueCodeFormState extends State<UniqueCodeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(data: false),
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
                  'This is for the Unique code form view',
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
      bottomNavigationBar: const BottomBar(),
    );
  }
}
