import 'package:flutter/material.dart';

import 'home_page.dart';

const Color primaryColor = Color(0xFFFF4A57); // Primary color
const Color bgColor = Color(0x242639); // Background color
const Color cardColor = Color(0x2B2D40); // Card color

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
