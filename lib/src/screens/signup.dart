import 'package:final_ui/src/screens/login.dart';
import 'package:final_ui/src/screens/reset.dart';
import 'package:final_ui/src/screens/verify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signup',
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/abc.png',
                ),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                ),
                child: Text(
                  'WelCome!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 60),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    color: Theme.of(context).accentColor,
                    child: Text('Signup'),
                    onPressed: () {
                      auth
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then(
                        (_) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => VerifyScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      'Back to Login Page',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
