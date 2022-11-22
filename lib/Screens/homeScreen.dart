import 'package:dialert/Constants/constants.dart';
import 'package:dialert/Screens/mainScreen.dart';
import 'package:dialert/Screens/runTest.dart';
import 'package:flutter/material.dart';



class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("Assets/Images/imghs1.jpg", width: double.infinity,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Colors.white12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
Text("Hello!", style:style4,),
SizedBox(height: 15,),
Text("Here's your Caretaker for Diabetes", style: style1,),
SizedBox(height: 15,),

Text("Rules you need to follow", style:style5),
SizedBox(height: 15,),

Text("=> Check your blood sugar levels regularly"),
Text("=> Be regular with your medication"),
Text("=> Look after your kidneys"),
Text("=> Control your cholesterol levels."),
Text("=> Eat right & exercise regularly"),
Text("=> Shed those extra pounds"),
SizedBox(height: 15,),

Center(child: TextButton(onPressed: (){
  Navigator.push(
          context, MaterialPageRoute(builder: (context) => mainScreen(screenIndex:3 )));
},child: Text("Run a Test"),))

              ],
            ),
          ),
        ),
      ],
    );
  }
}