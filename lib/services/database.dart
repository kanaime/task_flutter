import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_flutter/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final userCollection = FirebaseFirestore.instance.collection("users");

  // SAVE USER DATA
  Future saveUser(UserData user) async {
    userCollection.doc(uid).set(user.toMap(user));
  }

  // UPDATE USER DATA
  Future updateUser(UserData user) async {
    userCollection.doc(uid).set(user.toMap(user));
  }

  // RETURN DOCUMENT SNAPSHOT USER DATA
  get userSnapShotData {
    return userCollection.doc(uid).snapshots();
  }

  // RETURN USER DATA JSON
  get userData {
    return userCollection.doc(uid).get();
  }

  // GET USER LIST
  get userList {
    return userCollection.snapshots();
  }
}
