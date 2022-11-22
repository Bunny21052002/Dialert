import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class exerciseWidget extends StatelessWidget {
  String img;
  String txt1;
  String txt2;
  String txt3;
  exerciseWidget(
      {Key? key, required this.img, required this.txt1, required this.txt2,required this.txt3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(img),
            SizedBox(width: 20,),

        Column(
          children: [
            Text(
              txt1,
              style: style2,
            ),
            
            Text(
              txt2,
              maxLines: 4,
              style: style1,
            ),
            

            Text(
              txt3,
              maxLines: 4,
              style: style1,
            )
          ],
        )
      ],
    );
  }
}
