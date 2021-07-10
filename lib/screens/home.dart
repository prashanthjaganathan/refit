import 'package:flutter/material.dart';
import './body_fat.dart';
import './cal_abs.dart';
import './cal_arms.dart';
import './cal_chest.dart';
import './cal_legs.dart';
import './launchScreen.dart';
import './todays_act.dart';
import './weight_abs.dart';
import './weight_arms.dart';
import './weight_chest.dart';
import './weight_legs.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  //const Home({ Key? key }) : super(key//: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _cur = "Weight";
  DatabaseReference? ref;
  String? name;

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase(
            databaseURL: "https://refit-39952-default-rtdb.firebaseio.com/")
        .reference();
    ref?.child("Name").once().then((DataSnapshot data) {
      //print(data.value);
      setState(() {
        name = data.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _boxDecor = BoxDecoration(
      border: Border(
          bottom:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.5)),
    );

    return Scaffold(
      backgroundColor: Colors.black12,
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Colors.orange.shade50,
          //       Colors.orange.shade200,
          //       Colors.orange.shade400,
          //       Colors.orange,
          //       // Colors.orange.shade700,
          //       // Colors.black12,
          //       // Colors.black,
          //     ],
          //   ),
          // ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Text(
                          'Hey $name, Welcome to ReFit',
                          style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
              // ListTile(
              //   leading: Icon(Icons.calculate),
              //   title: Text('BMI Calculator'),
              // ),
              ListTile(
                selectedTileColor: Colors.orange,
                leading: Icon(
                  Icons.calculate,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Body Fat Calculator',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 17),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BodyFatCalculator();
                  }));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.food_bank,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Nutritional Info',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  launch("https://www.webmd.com/diet/default.htm");
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return LaunchScreen();
                  }), (route) => false);
                },
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          'ReFit',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TodayActivity();
                }));
              },
              icon: Icon(
                Icons.done,
                size: 25,
              )),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _cur = "Weight";
                  });
                },
                child: Container(
                    decoration: _cur == "Weight" ? _boxDecor : null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Weight Training',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _cur = "Calisthenics";
                  });
                },
                child: Container(
                    decoration: _cur == "Calisthenics" ? _boxDecor : null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Calisthenics',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          _cur == 'Calisthenics' ? HomeCalisthenics() : HomeWeight(),
        ],
      ),
    );
  }
}

class HomeCalisthenics extends StatelessWidget {
  //const HomeWeight({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        height: 650,
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ArmsCal();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/cal_arms.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'ARMS',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LegsCal();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/cal_legs.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'LEGS',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChestCal();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/cal_chest.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'CHEST',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AbsCal();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/cal_abs.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'CORE',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWeight extends StatelessWidget {
  // const HomeCalisthenics({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        height: 650,
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ArmsWeights();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/weight_arms.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'ARMS',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LegsWeights();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/weight_legs.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'LEGS',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChestWeights();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/weight_chest.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'CHEST',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AbsWeights();
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      "lib/assets/images/weight_abs.jpg",
                      fit: BoxFit.cover,
                      height: 200,
                      width: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, top: 120),
                      child: Text(
                        'CORE',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
