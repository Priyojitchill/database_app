// ignore_for_file: deprecated_member_use

import 'package:final_ui/src/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text('Logout'),
        onPressed: () {
          auth.signOut();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
    );
  }
}
