import 'package:flutter/material.dart';
import './home.dart';
import './login.dart';
import './register.dart';

class LaunchScreen extends StatelessWidget {
  //const LaunchScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        children: [
          Image.asset('lib/assets/images/launch.jpg',
              //color: Colors.black.withOpacity(0.8),
              //height: 800,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 580),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              child: Container(
                height: 45,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red.shade200.withOpacity(0.7),
                ),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 17,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 640),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              },
              child: Container(
                height: 45,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red.shade200.withOpacity(0.5), width: 2),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.red.shade200.withOpacity(0.7),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
