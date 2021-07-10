import 'package:flutter/material.dart';
import 'package:refit/global.dart';
import './todays_act.dart';
import 'package:refit/workout.dart';

class ArmsCal extends StatefulWidget {
  //const ArmsWeights({ Key? key }) : super(key: key);

  @override
  _ArmsCalState createState() => _ArmsCalState();
}

class _ArmsCalState extends State<ArmsCal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Arm Workout'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TodayActivity();
                }));
              },
              icon: Icon(Icons.done)),
        ],
      ),
      body: calArms.isEmpty
          ? Text(
              'Congratulations on completing today\'s workout!! Enjoy your day :)',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            )
          : SingleChildScrollView(
              child: Column(
                children: calArms.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: Card(
                      //color: Theme.of(context).primaryColor.withOpacity(0.7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 17),
                                ),
                              )),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    todaysAct.add(e);
                                    setState(() {
                                      calArms.remove(e);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
