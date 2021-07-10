import 'package:flutter/material.dart';
import 'package:refit/global.dart';
import './todays_act.dart';
import 'package:refit/workout.dart';

class ArmsWeights extends StatefulWidget {
  //const ArmsWeights({ Key? key }) : super(key: key);

  @override
  _ArmsWeightsState createState() => _ArmsWeightsState();
}

class _ArmsWeightsState extends State<ArmsWeights> {
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
      body: weightArms.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Text(
                'Congratulations on completing today\'s workout!! Enjoy your day :)',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          : Column(
              children: weightArms.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                e,
                                style: TextStyle(fontSize: 17),
                              )),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    todaysAct.add(e);
                                    setState(() {
                                      weightArms.remove(e);
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
                  ),
                );
              }).toList(),
            ),
    );
  }
}
