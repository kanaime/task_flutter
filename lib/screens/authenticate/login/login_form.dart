import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_flutter/services/auth.dart';
import 'package:task_flutter/shared/input.dart';
import 'package:task_flutter/shared/loading.dart';

import '../../homepage/homepage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  final _auth = FirebaseAuth;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormEmailContainer(emailController: emailController),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormPasswordContainer(
                      passwordController: passwordController),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 70, right: 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.purple,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (() async {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = 'Email ou mot de passe invalide';
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(title: 'titre home page')),
                          );
                        }
                      }),
                      child: Text('Valider')),
                ],
              ),
            )));
  }
}
