import 'package:final_ui/src/screens/login.dart';
import 'package:final_ui/src/screens/verify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: Text(
              'Reset password',
              style: TextStyle(color: Colors.green, fontSize: 35),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Send request'),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('back to Login page'),
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
