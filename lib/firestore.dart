import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> fetchedData = [];

  Future<void> getProjects() async {
    final collectionRef = _firestore.collection('projects');
    final querySnapshot = await collectionRef.get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> tempData = [];
      querySnapshot.docs.forEach((document) {
        final data = document.data();
        tempData.add(data);
      });

      // setState(() {
      //   fetchedData = tempData;
      // });
    }
  }

  void getMyPhoto() {
    final myPhoto = _firestore.collection('projects').get();
  }

  void getSkills() {}
}
