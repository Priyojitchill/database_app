import 'package:final_ui/src/screens/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
