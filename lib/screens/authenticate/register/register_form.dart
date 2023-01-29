import 'package:flutter/material.dart';
import 'package:task_flutter/screens/homepage/homepage.dart';
import 'package:task_flutter/services/auth.dart';
import 'package:task_flutter/shared/input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthService auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmePasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormNameContainer(
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormEmailContainer(emailController: emailController),
              SizedBox(
                height: 20,
              ),
              TextFormPasswordContainer(passwordController: passwordController),
              SizedBox(
                height: 20,
              ),
              TextFormConfirmPasswordContainer(
                  confirmePasswordController: confirmePasswordController,
                  passwordController: passwordController),
              SizedBox(height: 20),
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
                    dynamic result = await auth.registerWithEmailAndPassword(
                        email: emailController.text,
                        name: nameController.text,
                        password: passwordController.text);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = 'Champs invalides';
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
