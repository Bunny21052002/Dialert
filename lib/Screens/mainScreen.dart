import 'package:dialert/Constants/constants.dart';
import 'package:dialert/Screens/medicines.dart';
import 'package:dialert/Screens/profile.dart';
import 'package:dialert/Screens/runTest.dart';
import 'package:dialert/Screens/exercise.dart';
import 'package:dialert/Screens/foodAndHealth.dart';
import 'package:dialert/Screens/homeScreen.dart';
import 'package:dialert/Screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mainScreen extends StatefulWidget {
  int screenIndex;
  mainScreen({super.key, required this.screenIndex});

  @override
  State<mainScreen> createState() => _mainScreenState(screenIndex: screenIndex);
}

class _mainScreenState extends State<mainScreen> {
  final prefs =  SharedPreferences.getInstance();
  int screenIndex;
  _mainScreenState({required this.screenIndex});
  List<String> titleList = [
    "Welcome!",
    "Food & Health",
    "Lets Exercise",
    "Run Test",
    "Profile",
    "Medicines"
  ];
  List screens = [
    homeScreen(),
foodAndHealth(),
    exerciseScreen(),
    runTest(),
    profileScreen(),
    medicines(),
  ];
  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return Scaffold(
      drawer: Container(
        width: _size.width*0.7,
        color: Colors.green.shade100,
        child: ListView(
    
    padding: EdgeInsets.zero,
    children: [
        const DrawerHeader(
          
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Text('Welcome to Dialert'),
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {
           Navigator.push(
          context, MaterialPageRoute(builder: (context) => mainScreen(screenIndex:4 )));
          },
        ),
        ListTile(
          title: const Text('Your History'),
          onTap: () {
           
          },
        ),
        ListTile(
          title: const Text('Medicines'),
          onTap: () {
           Navigator.push(
          context, MaterialPageRoute(builder: (context) => mainScreen(screenIndex:5 )));
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () async{
            final prefs = await SharedPreferences.getInstance();
      await prefs.remove('email');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => splashScreen()));
          },
        ),
    ]),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:appBarColor,
        title: Text(titleList[screenIndex],style: style1, ),
      ),
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex<3?screenIndex:0,
        onTap: (int currentIndex) {
          setState(() {
            screenIndex = currentIndex;
          });
        },
        
        iconSize: 30,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.grey[600]),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
         BottomNavigationBarItem(
              icon: Image.asset("Assets/Images/bnbLogo1.png", height: 30,),label: "food"),
           BottomNavigationBarItem(
              icon: Image.asset("Assets/Images/bnbLogo2.png", height: 30,),label: "HealthCare"),
           BottomNavigationBarItem(
              icon: Image.asset("Assets/Images/bnbLogo3.png", height: 30,),label: "Exercise"),
        ],
      ),
      floatingActionButton: screenIndex==5? FloatingActionButton(onPressed: (){
        
      }, 
      backgroundColor: Colors.green.shade100,
      child: Icon(Icons.add),):null,
    );
  }
}
