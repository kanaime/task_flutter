import 'package:flutter/material.dart';
import 'package:task_flutter/models/user.dart';
import 'package:task_flutter/screens/users_management/user_profile/update_profil/update_user_profil.dart';

class UserInfosWidget extends StatefulWidget {
  final documents;
  const UserInfosWidget({required this.documents, super.key});

  @override
  State<UserInfosWidget> createState() => _UserInfosWidgetState();
}

class _UserInfosWidgetState extends State<UserInfosWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => Column(
        children: [
          Text(widget.documents['email']),
          Text(widget.documents['name']),
          Text(widget.documents['date']),
        ],
      ),
    );
  }
}
