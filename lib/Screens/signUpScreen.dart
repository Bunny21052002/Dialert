import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialert/Constants/constants.dart';
import 'package:dialert/Widgets/customButton.dart';
import 'package:dialert/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/textFieldWidget.dart';
import 'loginScreen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String signUpEmail = "";
  String _signUpName = "";
  String _contactNo = "";

  SignUpWithEmailAndPassword(
      {required String email, required String password}) async {
    final prefs = await SharedPreferences.getInstance();
    signUpEmail = email;
    await auth()
        .createUserWithEmailAndPassword(email: email, password: password);
    createUser( email: email);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => loginScreen()));
    prefs.setString("name", _nameController.text);
  }

  Future createUser({required email}) async {
    String _datetime = DateTime.now().toString();
    
    
    final docUser =
        FirebaseFirestore.instance.collection("Requests").doc(email);

    await docUser.set({});

    final docuser1 =
        FirebaseFirestore.instance.collection("Results").doc(email);

    await docuser1.set({});
    final docUser2 =
        FirebaseFirestore.instance.collection("Medicines").doc(email);
    await docUser2.set({});
  }

  @override
  void dispose() {
    _contactNo;
    signUpEmail;
    _signUpName;
    _resstatus;
    _emailController;
    _passwordController;
    _nameController;
    super.dispose();
  }

  String _resstatus = "";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: style2,
            ),
            SizedBox(
              height: _size.height * 0.1,
            ),
            Text("Name"),
            textFieldWidget(
                controller: _nameController,
                size: _size,
                txt: "Enter your name",
                inputType: TextInputType.text,
                x: false),
            Text("Email"),
            textFieldWidget(
              controller: _emailController,
              size: _size,
              txt: "Enter your Email",
              inputType: TextInputType.emailAddress,
              x: false,
            ),
            Text("Password"),
            textFieldWidget(
                controller: _passwordController,
                size: _size,
                txt: "Set Password",
                inputType: TextInputType.visiblePassword,
                x: true),
            SizedBox(
              height: 20,
            ),
            customButton(
                onTap: () {
                  SignUpWithEmailAndPassword(
                      email: _emailController.text.toString(),
                      password: _passwordController.text.toString());
                },
                txt: "Sign Up")
          ],
        ),
      ),
    );
  }
}
