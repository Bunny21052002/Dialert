import 'package:flutter/material.dart';

class customButton extends StatefulWidget {
  Function onTap;
  String txt;
  customButton({super.key, required this.onTap, required this.txt});

  @override
  State<customButton> createState() =>
      _customButtonState(onTap: onTap, txt: txt);
}

class _customButtonState extends State<customButton> {
  Function onTap;
  String txt;
  _customButtonState({required this.onTap, required this.txt});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
            child: Text(txt),
          ),
        ),
      ),
    );
  }
}
