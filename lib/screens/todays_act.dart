import 'package:flutter/material.dart';
import 'package:refit/global.dart';
import 'package:firebase_database/firebase_database.dart';

class TodayActivity extends StatefulWidget {
  //const TodayActivity({ Key? key }) : super(key: key);

  @override
  _TodayActivityState createState() => _TodayActivityState();
}

class _TodayActivityState extends State<TodayActivity> {
  int _creditScore = todaysAct.length * 5;
  bool _credited = false;
  DatabaseReference? ref;
  var phone;
  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase(
            databaseURL: "https://refit-39952-default-rtdb.firebaseio.com/")
        .reference();
    ref?.child("Phone").once().then((DataSnapshot data) {
      phone = data.value;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(phone);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Today\'s Activity'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1),
                ),
                child: Center(
                    child: Text(
                  'Credit score earned today: $_creditScore',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: todaysAct.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            todaysAct.isEmpty
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _credited
                              ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text(
                                            'Today\'s rewards has been credited.'),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'))
                                        ],
                                      ))
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text(
                                            '₹$_creditScore will be credited to the account assigned with $phone in an hour.'),
                                        content: Text('Keep pushing...'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _credited = true;
                                                _creditScore = 0;
                                                todaysAct.clear();
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Text('OK'),
                                          )
                                        ],
                                      ));
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Tap to claim rewards',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
          ],
        ),
      ),
    );
  }
}
