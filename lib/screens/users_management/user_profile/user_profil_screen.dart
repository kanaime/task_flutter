import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/screens/users_management/user_profile/user_widget.dart/user_profil_menu.dart';
import 'package:task_flutter/screens/users_management/user_profile/user_widget.dart/user_profil_pic.dart';
import 'package:task_flutter/shared/loading.dart';
import 'package:task_flutter/shared/navbar/navbar_top.dart';

import '../../../services/auth.dart';
import '../../../shared/navbar/custom_bottom_navbar.dart';
import '../../../shared/navbar/utils/back_button.dart';
import '../../../shared/navbar/utils/enum.dart';

class UserProfliScreen extends StatelessWidget {
  UserProfliScreen({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          text: 'Profile',
          back: BackButtonNavNone(),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: _auth.userSnapShotData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var documents = snapshot.data!;
                  return ProfilePic(documents: documents);
                }
                return Loading();
              }),
          SizedBox(height: 20),
          ProfileMenu(
            icones: Icons.settings,
            text: "Parametres",
            press: () {},
          ),
          ProfileMenu(
            icones: Icons.notifications,
            text: "Notifications",
            press: () {},
          ),
          ProfileMenu(
            icones: Icons.history,
            text: "Mon historique",
            press: () {},
          ),
          ProfileMenu(
            icones: Icons.logout,
            text: "Déconnexion",
            press: () {},
          ),
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
