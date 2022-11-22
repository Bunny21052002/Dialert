
import 'package:flutter/material.dart';

class textFieldWidget extends StatefulWidget {
  TextEditingController controller;
  bool x;
  TextInputType inputType;
  String txt;
  Size size;
  textFieldWidget({super.key, required this.size, required this.txt,required this.inputType, required this.x, required this.controller});

  @override
  State<textFieldWidget> createState() =>
      _textFieldWidgetState(size: size, txt: txt, inputType: inputType,x:x, controller: controller);
}

class _textFieldWidgetState extends State<textFieldWidget> {

  
  TextEditingController controller;
  bool x;
  TextInputType inputType;
  String txt;
  Size size;
  _textFieldWidgetState({required this.size, required this.txt, required this.inputType,required this.x, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4),
      child: Container(
        height: 45,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300, width: 2)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              
              controller:controller ,
              obscureText: x,
              keyboardType: inputType,
              decoration: InputDecoration.collapsed(hintText: txt),
              
            ),
          ),
        ),
      ),
    );
    
  }
}
