import 'package:flutter/material.dart';
import 'package:task_flutter/screens/homepage/homepage.dart';
import 'package:task_flutter/services/auth.dart';

class UserUpdateWidget extends StatefulWidget {
  final documents;
  const UserUpdateWidget({super.key, this.documents});

  @override
  State<UserUpdateWidget> createState() => _UserUpdateWidgetState();
}

class _UserUpdateWidgetState extends State<UserUpdateWidget> {
  final AuthService auth = AuthService();
  late String _name;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => Column(
        children: [
          Text(widget.documents['email']),
          TextFormField(
            initialValue: widget.documents['name'],
            onChanged: (value) {
              setState(() {
                _name = value.trim();
              });
            },
          ),
          ElevatedButton(
              onPressed: (() async {
                await auth.updateUserData(_name);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'title')),
                );
              }),
              child: Text('save'))
        ],
      ),
    );
  }
}
