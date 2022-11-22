import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class yourHistory extends StatefulWidget {
  const yourHistory({super.key});

  @override
  State<yourHistory> createState() => _yourHistoryState();
}

class _yourHistoryState extends State<yourHistory> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future getResult() async {
    final prefs = await SharedPreferences.getInstance();
    final String? _email = prefs.getString('email');
    Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore
      .collection('users')
      .doc(_email)
      .collection("results")
      .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    
    );
  }
}
