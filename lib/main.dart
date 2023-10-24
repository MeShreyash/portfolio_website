import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

const Color primaryColor = Color(0xFFFF4A57); // Primary color
const Color bgColor = Color(0x242639); // Background color
const Color cardColor = Color(0x2B2D40); // Card color

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC4GZL4SIRaEleVQ82SX4a1C7BD3aO3dNM",
      appId: "1:873674021768:web:a589383610642543c6783d",
      messagingSenderId: "873674021768",
      projectId: "portfolioweb-6bda1",
    ),
  );
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
