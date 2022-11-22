import 'package:dialert/Screens/loginScreen.dart';
import 'package:dialert/Screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  String _email = "";
  var _temp;
  @override
  void initState() {
    validation();
    screenNavigation(context);

    super.initState();
  }

  validation() async {}
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: _size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/Images/appLogo.png",
              width: _size.width * 0.8,
            ),
            Image.asset(
              "Assets/Images/img1.jpeg",
              width: _size.width * 0.6,
            ),
            CircularProgressIndicator(
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
  screenNavigation(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  

  await Future.delayed(const Duration(milliseconds: 1200), () {});
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (contex) =>(prefs.getString("email")==null)? const loginScreen():mainScreen(screenIndex: 0)));
}
}


