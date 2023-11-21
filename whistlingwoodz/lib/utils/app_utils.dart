import 'package:flutter/material.dart';

const Color colorWhite = Colors.white;
const Color colorPrimary = Color.fromARGB(255, 139, 46, 43);
const Color colorGrey = Colors.grey;

const String fontFamily = 'Montserrat';

showScaffold(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
