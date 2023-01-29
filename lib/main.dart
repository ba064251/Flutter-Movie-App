import 'package:flutter/material.dart';
import 'package:newsappflutter/generated/Screens/descriptionscreen.dart';
import 'package:newsappflutter/generated/Screens/homescreen.dart';
import 'package:newsappflutter/generated/Screens/registerscreen.dart';

import 'generated/Screens/loginscreen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}

