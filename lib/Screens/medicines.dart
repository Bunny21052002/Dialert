import 'package:flutter/material.dart';



class medicines extends StatefulWidget {
  const medicines({super.key});

  @override
  State<medicines> createState() => _medicinesState();
}

class _medicinesState extends State<medicines> {
  @override
  Widget build(BuildContext context) {
    Size _size= MediaQuery.of(context).size;

    return Container(
      height:_size.height ,
      width: _size.width,
      child: Column(
        children: [
          Image.asset("Assets/Images/medicines.png",width: _size.width,)
        ],
      ),
    );
  }
}