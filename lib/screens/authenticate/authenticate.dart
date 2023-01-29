import 'package:flutter/material.dart';
import 'package:task_flutter/screens/authenticate/login/login.dart';
import 'package:task_flutter/screens/authenticate/login/login_form.dart';
import 'package:task_flutter/screens/authenticate/register/register.dart';

class AuthenticateState extends StatefulWidget {
  const AuthenticateState({super.key});

  @override
  State<AuthenticateState> createState() => _AuthenticateStateState();
}

class _AuthenticateStateState extends State<AuthenticateState> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(toggleView: toggleView);
    } else {
      return RegisterScreen(toggleView: toggleView);
    }
  }
}
