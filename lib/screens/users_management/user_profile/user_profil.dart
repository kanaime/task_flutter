import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/screens/users_management/user_profile/read_profil/user_infos_widget.dart';
import 'package:task_flutter/screens/users_management/user_profile/update_profil/update_user_profil.dart';
import 'package:task_flutter/services/auth.dart';
import 'package:task_flutter/services/database.dart';
import 'package:task_flutter/shared/loading.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  bool update = true;
  void toggleUpdate() {
    setState(() {
      update = !update;
    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes infos'),
        backgroundColor: Color.fromARGB(255, 86, 77, 181),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              toggleUpdate();
            },
          ),
        ],
      ),
      body: StreamBuilder(
          stream: _auth.userSnapShotData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var documents = snapshot.data!;
              if (update) {
                return UserInfosWidget(documents: documents);
              }
              return UserUpdateWidget(
                documents: documents,
              );
            }
            return const Loading();
          }),
    );
  }
}
