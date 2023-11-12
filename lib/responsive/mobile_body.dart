import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/project.dart';
import '../models/skills.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0x212336),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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

            // Row(
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         _scrollController.animateTo(0,
            //             duration: Duration(seconds: 1), curve: Curves.easeIn);
            //       },
            //       child: Text(
            //         "Home",
            //         style: TextStyle(
            //           color: Colors.white, // Changed text color to white
            //         ),
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         _scrollController.animateTo(size.height,
            //             duration: Duration(seconds: 1), curve: Curves.easeIn);
            //       },
            //       child: Text(
            //         "Services",
            //         style: TextStyle(
            //           color: Colors.white, // Changed text color to white
            //         ),
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         _scrollController.animateTo(size.height * 2,
            //             duration: Duration(seconds: 1), curve: Curves.easeIn);
            //       },
            //       child: Text(
            //         "About",
            //         style: TextStyle(
            //           color: Colors.white, // Changed text color to white
            //         ),
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         _scrollController.animateTo(size.height * 3,
            //             duration: Duration(seconds: 1), curve: Curves.easeIn);
            //       },
            //       child: Text(
            //         "Skills",
            //         style: TextStyle(
            //           color: Colors.white, // Changed text color to white
            //         ),
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         _scrollController.animateTo(size.height * 4,
            //             duration: Duration(seconds: 1), curve: Curves.easeIn);
            //       },
            //       child: Text(
            //         "Portfolio",
            //         style: TextStyle(
            //           color: Colors.white, // Changed text color to white
            //         ),
            //       ),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         _scrollController.animateTo(size.height * 5,
            //             duration: Duration(seconds: 1), curve: Curves.easeIn);
            //       },
            //       child: Text(
            //         "Contact",
            //         style: TextStyle(
            //           color: Colors.white, // Changed text color to white
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      body: ListView(
        // controller: _scrollController,
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

//INTRO PAG
  Widget _introPage() {
    return Container(
      height: size.height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  introHeading(),
                  SizedBox(height: 10),
                  subHeading(),
                  journeyButton(),
                ],
              ),
            ),
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
            fontSize: 50,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          "a Front end Developer",
          style: TextStyle(
            fontSize: 50,
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
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  servicesHeading(),
                  SizedBox(height: 20),
                  serviceCardGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget servicesHeading() {
    return Column(
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
      ],
    );
  }

  Widget serviceCardGrid() {
    return SizedBox(
      height: size.height * 0.6,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 16 / 9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
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

  Widget _buildCard(IconData icon, String heading, String information) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
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
            SizedBox(height: 15),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  aboutHeading(),
                  SizedBox(height: 20),
                  aboutText(),
                  SizedBox(height: 40),
                  myImage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutHeading() {
    return Column(
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
      ],
    );
  }

  Widget aboutText() {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod turpis vitae est placerat, a laoreet tellus congue.",
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
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
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  skillHeading(),
                  SizedBox(height: 20),
                  skillCardGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget skillHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
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
        return SizedBox(
          height: size.height * 0.6,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 16 / 9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
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
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  desc,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  projectHeading(),
                  SizedBox(height: 20),
                  projectCardGrid(),
                ],
              ),
            ),
            SizedBox(width: size.width * 0.1),
          ],
        ),
      ),
    );
  }

  Widget projectHeading() {
    return Column(
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
      ],
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

        return SizedBox(
          height: size.height * 0.5,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
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
                    connectHeading(),
                    // TextFormFields for Email and Message
                    Container(
                      width: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
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
