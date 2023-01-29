import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/models/user.dart';
import 'package:task_flutter/screens/authenticate/authenticate.dart';
import 'package:task_flutter/screens/authenticate/register/register.dart';
import 'package:task_flutter/screens/users_management/user_profile/user_profil.dart';
import 'package:task_flutter/screens/users_management/user_profile/user_profil_screen.dart';
import 'package:task_flutter/screens/users_management/users_list/user_list.dart';
import 'package:task_flutter/services/auth.dart';
import 'package:task_flutter/services/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: Center(
            child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfliScreen()),
                  );
                },
                child: Text('Aller voir ses infos')),
            ElevatedButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserList()),
                  );
                }),
                child: Text('go voir la list')),
            ElevatedButton(
              child: Text('logout'),
              onPressed: () {
                auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AuthenticateState()),
                );
              },
            ),
          ],
        )));
  }
}
