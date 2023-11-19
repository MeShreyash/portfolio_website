import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firestore.dart';
import '../main.dart';
import '../models/project.dart';
import '../models/services.dart';
import '../models/skills.dart';

class WebsiteBody extends StatefulWidget {
  const WebsiteBody({super.key});

  @override
  State<WebsiteBody> createState() => _WebsiteBodyState();
}

class _WebsiteBodyState extends State<WebsiteBody> {
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

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF242639),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0x212336),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.74,
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
                      topicAppbarButton("Home", 0),
                      topicAppbarButton("Services", 1),
                      topicAppbarButton("About", 2),
                      topicAppbarButton("Skills", 3),
                      topicAppbarButton("Portfolio", 4),
                      topicAppbarButton("Contact", 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
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

  Widget topicAppbarButton(String topic, int pgNumber) {
    return TextButton(
      onPressed: () {
        _scrollController.animateTo(size.height * pgNumber,
            duration: Duration(seconds: 1), curve: Curves.easeIn);
      },
      child: Text(
        "$topic",
        style: TextStyle(
          color: Colors.white, // Changed text color to white
        ),
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

  Widget underlinedTopicHeading(String whiteHeading, redHeading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$whiteHeading",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),

        // Skill-Set Heading
        Text(
          "$redHeading",
          style: TextStyle(
            fontSize: 44,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Container(color: Colors.red, height: 5, width: 100),
      ],
    );
  }

//INTRO PAGE
  Widget _introPage() {
    return Container(
      alignment: Alignment.center,
      height: size.height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.62,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  introHeading(),
                  SizedBox(height: 10),
                  subHeading(),
                  journeyButton(),
                ],
              ),
            ),
            SizedBox(width: size.width * 0.1),
            threeDots(0),
          ],
        ),
      ),
    );
  }

  Widget introHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm",
          style: TextStyle(
            fontSize: 75,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          "a Front end Developer",
          style: TextStyle(
            fontSize: 75,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget subHeading() {
    return Container(
      width: 350,
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod turpis vitae est placerat, a laoreet tellus congue.",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white12,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget journeyButton() {
    return Container(
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
    );
  }

//SERVICES PAGE
  Widget _servicesPage() {
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
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
                  underlinedTopicHeading("Services", "Skill-Set"),
                  SizedBox(height: 20),
                  serviceCardGrid(),
                ],
              ),
            ),
            SizedBox(width: size.width * 0.1),
            threeDots(1),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String heading, String information) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
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
            SizedBox(height: 10),
            Container(
              height: 60.0,
              child: ListView(
                children: [
                  Text(
                    information,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceCardGrid() {
    return size.width > 1200
        ? GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 16 / 15,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              _buildCard(Icons.camera_alt_rounded, "Photography",
                  "Photography is the art of capturing moments, emotions, and stories with a single click, where every image has the power to speak a thousand words."),
              _buildCard(Icons.web_asset, "Web Development",
                  "Web development is like sculpting the digital world, where creativity meets technology to build immersive online experiences that shape the future of the internet."),
              _buildCard(Icons.app_shortcut_rounded, "App Design",
                  "App design is where user interface becomes a canvas, and user experience is a masterpiece waiting to be created, bringing innovation and usability to the palm of your hand"),
            ],
          )
        : SizedBox(
            height: size.height * 0.5,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 16 / 16,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                _buildCard(Icons.camera_alt_rounded, "Photography",
                    "Photography is the art of capturing moments, emotions, and stories with a single click, where every image has the power to speak a thousand words."),
                _buildCard(Icons.web_asset, "Web Development",
                    "Web development is like sculpting the digital world, where creativity meets technology to build immersive online experiences that shape the future of the internet."),
                _buildCard(Icons.app_shortcut_rounded, "App Design",
                    "App design is where user interface becomes a canvas, and user experience is a masterpiece waiting to be created, bringing innovation and usability to the palm of your hand"),
              ],
            ),
          );
  }

//ABOUT PAGE
  Widget _aboutPage() {
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // aboutHeading(),
                  underlinedTopicHeading("", "About"),
                  SizedBox(height: 20),
                  aboutText(),
                ],
              ),
            ),
            myImage(),
          ],
        ),
      ),
    );
  }

  Widget aboutText() {
    return Container(
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
    );
  }

  Widget myImage() {
    return Column(
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
    );
  }

//SKILLS PAGE
  Widget _skillsPage() {
    return Container(
      height: size.height,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
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
                  // skillHeading(),
                  underlinedTopicHeading("", "Skills"),
                  SizedBox(height: 20),
                  skillCardGrid(),
                ],
              ),
            ),
            SizedBox(width: size.width * 0.1),
            threeDots(1),
          ],
        ),
      ),
    );
  }

  Widget skillCardGrid() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('skills').snapshots(),
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
          Map<String, dynamic> data = d.data()! as Map<String, dynamic>;
          final s = Skill(data['name'] ?? "Name", data['desc'] ?? "Loda mera");
          skillsList.add(s);
        }
        return size.width > 1200
            ? SizedBox(
                height: size.height * 0.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 16 / 9),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: skillsList.length,
                  itemBuilder: (context, rowIndex) {
                    Skill skills = skillsList[rowIndex];
                    return _skillCard(skills.name, skills.desc);
                  },
                ),
              )
            : SizedBox(
                height: size.height * 0.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 16 / 9),
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
            Container(
              height: 60.0, // Adjust the height as needed
              child: ListView(
                children: [
                  Text(
                    desc,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
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
      child: FittedBox(
        fit: BoxFit.scaleDown,
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
                  underlinedTopicHeading("Portfolio", "My Projects"),
                  SizedBox(height: 20),
                  projectCardGrid(),
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

  Widget projectCardGrid() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('projects').snapshots(),
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
          final projectName = data['projectName'] ?? 'No name available';
          final projDesc = data['projDesc'] ?? 'No Description available';
          final image = data['image'] ?? ['No image found!'];

          return Project(
            projectId: project.id,
            projectName: projectName,
            projDesc: projDesc,
            image: image,
          );
        }).toList();

        return size.width > 1200
            ? SizedBox(
                height: size.height * 0.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              )
            : SizedBox(
                height: size.height * 0.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
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
      child: FittedBox(
        fit: BoxFit.scaleDown,
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
                    // TextFormFields for Email and Message
                    Container(
                      width: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          connectHeading(),
                          inputTextField("Email"),
                          SizedBox(height: 20),
                          inputTextField("Message"),
                          SizedBox(height: 20),
                          textButton(),
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
      ),
    );
  }

  Widget connectHeading() {
    return Column(
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
        SizedBox(height: 20),
      ],
    );
  }

  Widget inputTextField(String label) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey.withOpacity(0.2),
      child: SizedBox(
        height: 50, // Increase the height for more space
        child: TextFormField(
          decoration: InputDecoration(
            labelText: "$label",
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20, // Increase the label text size
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none, // Hide the underline when focused
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide.none, // Hide the underline when not focused
            ),
          ),
        ),
      ),
    );
  }

  Widget textButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
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
    );
  }
}
