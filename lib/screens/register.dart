import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './home.dart';

class RegisterScreen extends StatefulWidget {
  //const RegisterScreen({ Key? key }) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late DatabaseReference ref;
  FirebaseDatabase database = FirebaseDatabase(
      databaseURL: "https://refit-39952-default-rtdb.firebaseio.com/");

  final _name = new TextEditingController();

  final _phone = new TextEditingController();

  final _password = new TextEditingController();

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase(
            databaseURL: "https://refit-39952-default-rtdb.firebaseio.com/")
        .reference();
  }

  void _saveData() {
    ref.child("Name").set(_name.text);
    ref.child("Phone").set(_phone.text);
    ref.child("Password").set(_password.text);
    //print('saved');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _name.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final ref = fb.reference();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "lib/assets/images/register.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                // child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: TextField(
                        controller: _phone,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontStyle: FontStyle.italic),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.red.shade400,
                          ),
                          //fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          controller: _name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontStyle: FontStyle.italic),
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.red.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontStyle: FontStyle.italic),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.red.shade400,
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // print(_name.value.text);
                        // print(_password.text);
                        // print(_phone.text);
                        // print('I\'m back');
                        if (_name.text.isNotEmpty &&
                            _phone.text.isNotEmpty &&
                            _password.text.isNotEmpty) {
                          _saveData();
                          //print('I\'m in');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                        } else {
                          //print('in toast');
                          Fluttertoast.showToast(
                            msg: "Please fill in all the details",
                            backgroundColor: Colors.black,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red.shade400,
                          ),
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 3,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 251,
                    ),
                  ],
                ),
              ),
            ),
            // ),
          ),
        ],
      ),
    );
  }
}
