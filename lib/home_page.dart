import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive/mobile_body.dart';
import 'package:portfolio_website/responsive/website_body.dart';
import 'package:portfolio_website/screens/responsive_layout.dart';
import 'firestore.dart';
import 'main.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'models/project.dart';
import 'models/skills.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  int currentPage = 0;

  String imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0qCreqkTZL0F0bF9kZctFE1XVFocO__70kw&usqp=CAU";
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    FireStore().getProjects();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _viewportWidth = 0.0;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF242639),

      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: WebsiteBody(),
      ),
    );
  }  
}
