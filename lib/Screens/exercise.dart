import 'package:dialert/Constants/constants.dart';
import 'package:flutter/material.dart';

import '../Widgets/exerciseWIdget.dart';

class exerciseScreen extends StatelessWidget {
  const exerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: _size.height,
      width: _size.width,
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            exerciseWidget(img: "Assets/Images/exerciseImg1.png",txt1: "Meditation",txt2: "Meditate daily ",txt3: "for 15-20 mins",),
            SizedBox(
              height: _size.height*0.1,
            ),
            exerciseWidget(img: "Assets/Images/exerciseImg3.png",txt1: "Cycling",txt2: "Ride a cycle for ",txt3: "atleast for an hour",),
             SizedBox(
              height: _size.height*0.1,
            ),
            exerciseWidget(img: "Assets/Images/exerciseImg2.png",txt1: "Walking",txt2: "Have an early morning walk",txt3: "",),
            
          ],
        ),
      ),
    
    
    
    );
  }
}


