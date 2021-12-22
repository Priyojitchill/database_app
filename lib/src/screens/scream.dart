import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_ui/src/screens/display.dart';
import 'package:final_ui/src/screens/login.dart';
import 'package:final_ui/src/screens/signout.dart';
import 'package:final_ui/src/screens/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  //Widget a = Store2Screen();
  final _widgetOptions = [StoreScreen(), DisplayScreen(), LogoutScreen()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Records',
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: "Enter Records",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_display),
            label: "Display Records",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "Logout",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
