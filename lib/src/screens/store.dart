import 'package:final_ui/src/screens/display.dart';
import 'package:final_ui/src/screens/login.dart';
import 'package:final_ui/src/screens/scream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class StoreScreen extends StatefulWidget {
  //const StoreScreen({ Key? key }) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  DateTime _myDateTime = DateTime.now();
  String _name = '', _date = '', _gender = '';
  String dropDownValue = 'Male';
  List<String> genderValues = ['Male', 'Female'];
  void getDropDownItem() {
    setState(() {
      _gender = dropDownValue;
    });
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter The name',
            ),
            onChanged: (value) {
              setState(
                () {
                  _name = value.toString();
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: () async {
              _myDateTime = (await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              ))!;
              setState(
                () {
                  _date = DateFormat('dd/mm/yyyy').format(_myDateTime);
                },
              );
            },
            child: Text(
              "Select Date of Birth",
            ),
          ),
          DropdownButton<String>(
            value: dropDownValue,
            dropdownColor: Colors.blue,
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            items:
                genderValues.map<DropdownMenuItem<String>>((String valueItem) {
              return DropdownMenuItem<String>(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(
                () {
                  dropDownValue = value!;
                  //print("$_gender");
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: getDropDownItem,
            child: Text('Enter'),
          ),
          ElevatedButton(
            onPressed: () async {
              await users.add(
                {
                  'Name of the Student': _name,
                  'Date of Birth': _date,
                  'Gender': _gender,
                },
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            child: Text(
              'Submit data',
            ),
          ),
        ],
      ),
    );
  }
}
