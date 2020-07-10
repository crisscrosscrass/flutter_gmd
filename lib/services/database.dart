import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gmd/models/project.dart';
import 'package:gmd/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference projectCollection =
      Firestore.instance.collection('projects');
  Future updateUserData(String sugar, String name, int strength) async {
    return await projectCollection.document(uid).setData({
      'sugars': sugar,
      'name': name,
      'strength': strength,
    });
  }

  // project list from snapshot
  List<Project> _projectListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Project(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars']);
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']);
  }

  // get projects streams
  Stream<List<Project>> get projects {
    return projectCollection.snapshots().map(_projectListFromSnapshot);
  }

  // get user stream
  Stream<UserData> get userData {
    return projectCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
