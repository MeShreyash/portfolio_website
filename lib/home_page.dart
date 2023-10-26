import 'package:flutter/material.dart';
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
    // getProjects();
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
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0x212336),
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 200.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'amog',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Changed text color to white
                    ),
                  ),
                  Text(
                    'o',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red color for 'o'
                    ),
                  ),
                  Text(
                    'e',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Changed text color to white
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _scrollController.animateTo(0,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white, // Changed text color to white
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollController.animateTo(size.height,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                    child: Text(
                      "Services",
                      style: TextStyle(
                        color: Colors.white, // Changed text color to white
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollController.animateTo(size.height * 2,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                    child: Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white, // Changed text color to white
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollController.animateTo(size.height * 3,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                    child: Text(
                      "Skills",
                      style: TextStyle(
                        color: Colors.white, // Changed text color to white
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollController.animateTo(size.height * 4,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                    child: Text(
                      "Portfolio",
                      style: TextStyle(
                        color: Colors.white, // Changed text color to white
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _scrollController.animateTo(size.height * 5,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                    },
                    child: Text(
                      "Contact",
                      style: TextStyle(
                        color: Colors.white, // Changed text color to white
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          _introPage(),
          _servicesPage(),
          _aboutPage(),
          _skillsPage(),
          _portfolioPage(),
          _contactPage(),
        ],
      ),
    );
  }

  Widget selectedDot() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }

  Widget unSelectedDot() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2.0, // Border width
          color: Colors.red, // Border color
        ),
        color: Colors.transparent,
      ),
    );
  }

  Widget line() {
    return Container(
      height: 65,
      color: Colors.grey,
      width: 1.5,
    );
  }

  Widget threeDots(int selected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        (selected == 0) ? selectedDot() : unSelectedDot(),
        line(),
        (selected == 1) ? selectedDot() : unSelectedDot(),
        line(),
        (selected == 2) ? selectedDot() : unSelectedDot(),
      ],
    );
  }

//INTRO PAGE
  Widget _introPage() {
    return Container(
      alignment: Alignment.center,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, I'm",
                    style: TextStyle(
                      fontSize: 75,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Hybi11Amigo', // Use the custom font
                    ),
                  ),
                  Text(
                    "a Front end Developer",
                    style: TextStyle(
                      fontSize: 75,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Hybi11Amigo', // Use the custom font
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod turpis vitae est placerat, a laoreet tellus congue.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white12,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 20.0,
                        ),
                        child: Text(
                          "Creator Journey",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.1,
            ),
            threeDots(0),
          ],
        ),
      ),
    );
  }

//SERVICES PAGE
  Widget _servicesPage() {
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Services",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Skill-Set Heading
                  Text(
                    "Skill-Set",
                    style: TextStyle(
                      fontSize: 44,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 100,
                  ),
                  SizedBox(height: 20),

                  // Grid of Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCard(Icons.abc, "Heading 1", "Information 1"),
                      _buildCard(Icons.alarm, "Heading 2", "Information 2"),
                      _buildCard(Icons.lock, "Heading 3", "Information 3"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.1,
            ),
            threeDots(1),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String heading, String information) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 300,
      height: 250,
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Icon(
                  icon,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              Text(
                heading,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 60,
                child: SingleChildScrollView(
                  child: Text(
                    information,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//ABOUT PAGE
  Widget _aboutPage() {
    // final storage = FirebaseStorage.instance;

    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 44,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod turpis vitae est placerat, a laoreet tellus congue.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('myphoto')
                      .doc('portfoliophoto')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    // Get the image URL from the Firestore document
                    String imageUrl = snapshot.data!['imageUrl'];
                    return Container(
                      height: size.height * 0.5,
                      width: size.height * 0.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4.0,
                          color: Colors.red,
                        ),
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//SKILLS PAGE
  Widget _skillsPage() {
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Skills Heading
                  Text(
                    "Skills",
                    style: TextStyle(
                      fontSize: 44,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 100,
                  ),
                  SizedBox(height: 20),

                  // List of Skills
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('skills')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Text('No skills available.');
                      }

                      final skills = snapshot.data!.docs;
                      // print(skills);
                      List<Skill> skillsList = [];
                      for (QueryDocumentSnapshot d in skills) {
                        Map<String, dynamic> data =
                            d.data()! as Map<String, dynamic>;
                        final s = Skill(data['name'] ?? "Name",
                            data['desc'] ?? "Loda mera");
                        skillsList.add(s);
                      }
                      return SizedBox(
                        height: size.height * 0.5,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 16 / 9),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: skillsList.length,
                          itemBuilder: (context, rowIndex) {
                            Skill skills = skillsList[rowIndex];
                            return _skillCard(skills.name, skills.desc);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.1,
            ),
            threeDots(1),
          ],
        ),
      ),
    );
  }

  Widget _skillCard(String heading, String desc) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

//PORTFOLIO PAGE
  Widget _portfolioPage() {
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Portfolio",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Skill-Set Heading
                  Text(
                    "My Projects",
                    style: TextStyle(
                      fontSize: 44,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.red,
                    height: 5,
                    width: 100,
                  ),
                  SizedBox(height: 20),

                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('projects')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Text('No projects available.');
                      }

                      final projects = snapshot.data!.docs;
                      List<Project> projectList = projects.map((project) {
                        final data = project.data() as Map<String, dynamic>;
                        final projectName =
                            data['projectName'] ?? 'No name available';
                        final projDesc =
                            data['projDesc'] ?? 'No Description available';
                        final image = data['image'] ?? ['No image found!'];

                        return Project(
                          projectId: project.id,
                          projectName: projectName,
                          projDesc: projDesc,
                          image: image,
                        );
                      }).toList();

                      return SizedBox(
                        height: size.height * 0.5,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                          ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: projectList.length,
                          itemBuilder: (context, rowIndex) {
                            Project project = projectList[rowIndex];
                            return _projectCard(project);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * 0.1,
            ),
            threeDots(1),
          ],
        ),
      ),
    );
  }

  Widget _projectCard(Project project) {
    PageController controller = PageController();
    int index = 0;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: cardColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: PageView.builder(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: project.image.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      project.image[index],
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      if (index == 0) {
                        return;
                      }
                      index -= 1;
                      controller.animateToPage(index,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.ease);
                    },
                    icon: Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                    )),
                IconButton(
                  onPressed: () {
                    if (index == project.image.length) {
                      return;
                    }
                    index += 1;
                    controller.animateToPage(index,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    project.projectName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Text(
                  //   project.projDesc,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//CONTACT PAGE
  Widget _contactPage() {
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: SizedBox(
              width: size.width * 0.62,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Connect with me",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // TextFormFields for Email and Message
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: 450,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.grey.withOpacity(0.2),
                          child: SizedBox(
                            height: 50, // Increase the height for more space
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20, // Increase the label text size
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide
                                      .none, // Hide the underline when focused
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide
                                      .none, // Hide the underline when not focused
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.grey.withOpacity(0.2),
                          child: SizedBox(
                            height: 50, // Increase the height for more space
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Message",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20, // Increase the label text size
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide
                                      .none, // Hide the underline when focused
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide
                                      .none, // Hide the underline when not focused
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  // horizontal: 25,
                                  vertical: 15.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Stay Connected",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.1,
          ),
          threeDots(2),
        ],
      ),
    );
  }
}
