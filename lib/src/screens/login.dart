import 'package:final_ui/src/screens/reset.dart';
import 'package:final_ui/src/screens/scream.dart';
import 'package:final_ui/src/screens/signup.dart';
import 'package:final_ui/src/screens/store.dart';
import 'package:final_ui/src/screens/verify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '', _password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 50),
                    child: Text(
                      'New User click signup!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Signin',
                    ),
                    onPressed: () {
                      auth
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then(
                        (_) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text('Go to Signup page'),
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ResetScreen(),
                      ),
                    ),
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
