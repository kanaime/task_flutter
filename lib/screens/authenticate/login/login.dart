import 'package:flutter/material.dart';
import 'package:task_flutter/screens/authenticate/login/login_form.dart';
import 'package:task_flutter/screens/authenticate/login/widget/login_widget.dart';
import 'package:task_flutter/shared/loading.dart';
import 'package:task_flutter/shared/navbar/navbar_top.dart';
import 'package:task_flutter/shared/navbar/utils/back_button.dart';

class LoginScreen extends StatelessWidget {
  final Function toggleView;
  bool loading = false;
  LoginScreen({super.key, required this.toggleView});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Navbar(
                text: 'Connexion',
                back: BackButtonNavNone(),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconContainer(),
                  TitleContainer(text: "Re Bonjour"),
                  SizedBox(
                    height: 10,
                  ),
                  SubtitleContainer(
                    text: "Te revoila !",
                  ),
                  SizedBox(height: 5),
                  LoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('pas de Compte?'),
                      TextButton(
                          onPressed: (() {
                            toggleView();
                          }),
                          child: Text('enregistre toi',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 75, 64, 175))))
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
