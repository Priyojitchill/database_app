import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text("There is no Record");
          return Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: ListView(
                children: getExpenseItems(snapshot),
                //padding: EdgeInsets.all(10.0),
              ));
        });
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map((doc) => ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              selectedTileColor: Colors.grey[300],
              title: Text(
                doc["Name of the Student"],
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text(
                doc["Date of Birth"],
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text(
                doc["Gender"],
                style: TextStyle(fontSize: 20),
              ),
            ))
        .toList();
  }
}
