import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialert/Constants/constants.dart';
import 'package:dialert/Widgets/customButton.dart';
import 'package:dialert/Widgets/textFieldWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class runTest extends StatefulWidget {
  const runTest({super.key});

  @override
  State<runTest> createState() => _runTestState();
}

class _runTestState extends State<runTest> {
  TextEditingController _glucose = TextEditingController();
  TextEditingController _sbp = TextEditingController();
  TextEditingController _dbp = TextEditingController();
  TextEditingController _bmi = TextEditingController();
  TextEditingController _age = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  // apiCall(
  //   int glucose,
  //   int sbp,
  //   int dbp,
  //   int bmi,
  //   int age,
  // ) async {
  //   var request =
  //       http.Request('POST', Uri.parse("http://127.0.0.1:5000/predict"));
  //   request.body = json.encode({
  //     "user_data": {
  //       "Glucose": glucose,
  //       "Systolic Blood Pressure": sbp,
  //       "Diastolic Blood Pressure": dbp,
  //       "BMI": bmi,
  //       "Age": age
  //     }
  //   });

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            "Enter your Details",
            style: style2,
          )),
          textFieldWidget(
            size: _size,
            txt: "Glucose level",
            inputType: TextInputType.number,
            controller: _glucose,
            x: false,
          ),
          textFieldWidget(
              size: _size,
              txt: "Systolic Blood Pressure",
              inputType: TextInputType.number,
              controller: _sbp,
              x: false),
          textFieldWidget(
              size: _size,
              txt: "Diastolic Blood Pressure",
              inputType: TextInputType.number,
              controller: _dbp,
              x: false),
          textFieldWidget(
              size: _size,
              txt: "Enter your BMI Value",
              inputType: TextInputType.number,
              controller: _bmi,
              x: false),
          textFieldWidget(
              size: _size,
              txt: "Please enter your Age",
              inputType: TextInputType.number,
              controller: _age,
              x: false),

          GestureDetector(
            onTap: () {
              addToData(
                age: _age.text,
                bmi: _bmi.text,
                dbp: _dbp.text,
                glevel: _glucose.text,
                sbp: _sbp.text,
              );
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  elevation: 2,
                  title: const Text('Test Submitted'),
                  content:
                      const Text('Relax! You can see result in Your history'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 30),
                  child: Text("Check"),
                ),
              ),
            ),
          )
          // customButton(onTap: () {
          //   setState(() {
          //     _intglucose = int.parse(_glucose.text.toString());
          //     _intsbp = int.parse(_sbp.text);
          //     _intdbp = int.parse(_dbp.text);
          //     _intbmi = int.parse(_bmi.text);
          //     _intage = int.parse(_age.text);
          //   });

          //     //apiCall(_intglucose, _intsbp, _intdbp, _intbmi, _intage);
          //   }, txt: "Check")
        ],
      ),
    );
  }

  void addToData(
      {required glevel,
      required sbp,
      required dbp,
      required bmi,
      required age}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final prefs = await SharedPreferences.getInstance();
    String _email = prefs.getString('email')!;

    try {
      await _firestore
          .collection('Results')
          .doc(_email)
          .collection('results')
          .add({"Date and Time": DateTime.now(), "Result": "Status Pending"});
    } catch (e) {
      print(e);
    }
    try{
     await _firestore
          .collection('Requests')
          .doc(_email)
          .collection('requests')
          .add({
            "Glucose Level": glevel,
            "Systolic Blood Pressure": sbp,
            "Diastolic Blood Pressure":dbp,
            "BMI":bmi,
            "Age":age,
            });
    } catch (e) {
      print(e);
    }
  }
}
