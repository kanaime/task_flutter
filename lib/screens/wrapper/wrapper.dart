import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/screens/authenticate/authenticate.dart';
import 'package:task_flutter/screens/homepage/homepage.dart';
import 'package:task_flutter/screens/users_management/users_list/user_list.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;
    if (auth == null) {
      return AuthenticateState();
    } else {
      return MyHomePage(title: 'title');
    }
  }
}
