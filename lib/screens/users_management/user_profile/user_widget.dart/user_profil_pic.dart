import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final documents;
  ProfilePic({Key? key, required this.documents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            SizedBox(width: 30),
            SizedBox(
              height: 90,
              width: 90,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/Circle-icons-profile.svg.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -1,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        backgroundColor: Color.fromARGB(255, 148, 148, 148),
                        elevation: 0,
                        onPressed: () {},
                        child: Icon(
                          Icons.add_a_photo,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Bonjour ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 47, 24, 53)),
                          textAlign: TextAlign.left),
                      Text(documents['name'])
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [SizedBox(width: 1), Text(documents['email'])],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
