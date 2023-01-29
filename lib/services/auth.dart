import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:task_flutter/models/user.dart';
import 'package:task_flutter/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  get uid {
    return _auth.currentUser?.uid;
  }

  get userSnapShotData {
    return DatabaseService(uid).userSnapShotData;
  }

  get userData async {
    var data = await DatabaseService(uid).userData;
    return UserData(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        date: data['date']);
  }

  get usersList {
    return DatabaseService(uid).userList;
  }

  Future registerWithEmailAndPassword(
      {String? name, required String email, required String password}) async {
    try {
      //Creation d'un user avec Firebase Auth

      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //On check si User != null
      if (user == null) {
        throw Exception("No user found");
      } else {
        // On recupere les données sous format de la class user
        UserData userData = UserData(
            id: user.uid,
            name: name,
            email: email,
            date: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString());

        // On sauvegarde dans la BDD
        await DatabaseService(user.uid).saveUser(userData);
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // DECONNEXION

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  // CONNEXION

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  // UPDATE USER INFORMATION

  Future updateUserData(String _name) async {
    var data = await userData;
    data.name = _name;
    await DatabaseService(uid).updateUser(data);
  }
}
