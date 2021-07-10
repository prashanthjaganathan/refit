import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './home.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({ Key? key }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = new TextEditingController();

  final _passwordController = new TextEditingController();
  DatabaseReference? ref;
  bool _loginPhone = false;
  bool _loginPass = false;

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase(
            databaseURL: "https://refit-39952-default-rtdb.firebaseio.com/")
        .reference();
  }

  void checkDetails() async {
    //print(int.parse(_phoneController.text.toString()));
    await ref?.child("Phone").once().then((DataSnapshot data) {
      //print(data.value.toString());
      if (int.parse(_phoneController.text.toString()) ==
          int.parse(data.value.toString())) {
        //print('phone correct');
        _loginPhone = true;
      }
    });
    await ref?.child("Password").once().then((DataSnapshot data) {
      if (_passwordController.text == data.value) {
        // print('in pass');
        _loginPass = true;
      }
    });
    if (_loginPhone == true && _loginPass == true) {
      _loginPhone = false;
      _loginPass = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Home();
      }));
    } else {
      Fluttertoast.showToast(msg: "Invalid Login Details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "lib/assets/images/login1.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 400,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                // backgroundBlendMode: BlendMode.color,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 35),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: TextField(
                          cursorColor: Colors.blue,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            //fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            // filled: true,
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            prefixIcon:
                                Icon(Icons.mail, color: Colors.blue.shade500),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 10),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          cursorColor: Colors.blue,
                          controller: _passwordController,
                          obscureText: true,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          decoration: InputDecoration(
                            //fillColor: Colors.white,
                            //filled: true,
                            hintText: 'Password',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: InkWell(
                        onTap: () {
                          checkDetails();
                        },
                        child: Container(
                          width: 335,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue.shade500,
                          ),
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 3,
                                  //fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
