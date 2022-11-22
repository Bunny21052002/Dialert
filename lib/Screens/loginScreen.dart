import 'package:dialert/Screens/mainScreen.dart';
import 'package:dialert/Screens/signUpScreen.dart';
import 'package:dialert/Widgets/customButton.dart';
import 'package:dialert/Widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dialert/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/textFieldWidget.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String? errormessage = "";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  @override
  void dispose() {
    _emailController;
    _passwordController;
    super.dispose();
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    print("hello1");
    try {
      await auth().signInWithEmailAndPassword(email: email, password: password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => mainScreen(screenIndex: 0)));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
            ),
            SizedBox(
              height: _size.height * 0.1,
            ),
            Text("Email"),
            textFieldWidget(
              controller: _emailController,
              size: _size,
              txt: "Enter Your Email",
              inputType: TextInputType.emailAddress,
              x: false,
            ),
            Text("Password"),
            textFieldWidget(
              size: _size,
              txt: "Password",
              inputType: TextInputType.visiblePassword,
              controller: _passwordController,
              x: true,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: customButton(
                onTap: () {
                  signInWithEmailAndPassword(
                      email: _emailController.text.toString(),
                      password: _passwordController.text.toString());
                },
                txt: "Login",
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Don't have an account? ",
                  ),
                  TextButton(
                    child: Text("Create Account"),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (contex) => signUpScreen())),
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

class Line extends StatelessWidget {
  const Line({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.15,
      height: 2,
      color: Colors.black,
    );
  }
}
