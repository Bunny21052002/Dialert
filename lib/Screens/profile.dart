import 'package:dialert/Constants/constants.dart';
import 'package:dialert/Screens/signUpScreen.dart';
import 'package:dialert/Widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileScreen extends StatefulWidget {
  profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool _namebool = false;
  bool _emailbool = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prefs = SharedPreferences.getInstance();
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "Assets/Images/profileImg.png",
              width: _size.width * 0.5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "E-mail:- ",
                  style: style1,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _emailbool = !_emailbool;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _emailbool
                            ? textFieldWidget(
                                size: _size,
                                txt: "Enter your E-mail",
                                inputType: TextInputType.text,
                                x: false,
                                controller: _email)
                            : Text(_email.text),
                      ),
                    )),
                     SizedBox(
                  height: 10,
                ),
                    Text(
                  "Name:- ",
                  style: style1,
                ),
                 SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _namebool = !_namebool;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber.shade100,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _namebool
                            ? textFieldWidget(
                                size: _size,
                                txt: "Enter your name",
                                inputType: TextInputType.text,
                                x: false,
                                controller: _name)
                            : Text(_name.text),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
