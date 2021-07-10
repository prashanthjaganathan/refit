import 'package:flutter/material.dart';
import 'package:refit/global.dart';
import './todays_act.dart';
import 'package:refit/workout.dart';

class ChestWeights extends StatefulWidget {
  //const ArmsWeights({ Key? key }) : super(key: key);

  @override
  _ChestWeightsState createState() => _ChestWeightsState();
}

class _ChestWeightsState extends State<ChestWeights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Chest Workout'),
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
      body: weightChest.isEmpty
          ? Text(
              'Congratulations on completing today\'s workout!! Enjoy your day :)',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            )
          : Column(
              children: weightChest.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
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
                                    weightChest.remove(e);
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
    );
  }
}
