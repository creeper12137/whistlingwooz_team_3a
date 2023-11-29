import 'package:flutter/material.dart';

const Color colorWhite = Colors.white;
const Color colorPrimary = Color.fromARGB(255, 139, 46, 43);
const Color colorGrey = Colors.grey;
const appBackGroundColor = Color(0xff510400);
const centerColor = Color.fromARGB(255, 139, 46, 43);
const bottomNavigationColor = Colors.black;

const String fontFamily = 'Montserrat';

showScaffold(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
