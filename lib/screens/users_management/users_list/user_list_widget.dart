import 'package:flutter/material.dart';

class UserListBody extends StatefulWidget {
  final documents;
  const UserListBody({required this.documents, super.key});

  @override
  State<UserListBody> createState() => _UserListBodyState();
}

class _UserListBodyState extends State<UserListBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.documents.length,
        itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${widget.documents[index]['name']}'),
                Text('${widget.documents[index]['email']}')
              ],
            ));
  }
}
