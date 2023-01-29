import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_flutter/screens/authenticate/register/register_form.dart';
import 'package:task_flutter/shared/loading.dart';
import 'package:task_flutter/shared/navbar/navbar_top.dart';

import '../../../shared/navbar/utils/back_button.dart';

class RegisterScreen extends StatelessWidget {
  final Function toggleView;
  bool loading = false;
  RegisterScreen({super.key, required this.toggleView});

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
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  Text(
                    "Bienvenue !",
                    style: GoogleFonts.bebasNeue(fontSize: 40),
                  ),
                  const Text(
                    "Inscris toi!",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  RegisterForm(),
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
