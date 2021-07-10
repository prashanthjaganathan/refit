import 'package:flutter/material.dart';

class BodyFatCalculator extends StatefulWidget {
  //const BodyFatCalculator({ Key? key }) : super(key: key);

  @override
  _BodyFatCalculatorState createState() => _BodyFatCalculatorState();
}

class _BodyFatCalculatorState extends State<BodyFatCalculator> {
  var _waist = 0, _bodyWeight = 0, _hip, _forearm, _wrist;
  var _gender = "Male";

  void calculateMale() async {
    var _leanBody = (_bodyWeight * 1.082) + 94.42 - (_waist * 4.15);
    var _bodyFat = _bodyWeight - _leanBody;
    int _bodyFatPerc = ((_bodyFat * 100) ~/ _bodyWeight);
    var _status;
    if (_bodyFatPerc >= 22) {
      _status = "Obese";
    } else if (_bodyFatPerc >= 15) {
      _status = "Average";
    } else if (_bodyFatPerc < 15) {
      _status = "Fit";
    }
    setState(() {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('Your Body Fat Percentage: $_bodyFatPerc%'),
                content: Text("Status: $_status"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK")),
                ],
              ));
    });
  }

  void calculateFemale() {
    var _leanBody = (_bodyWeight * 0.732) +
        8.987 +
        (_wrist / 3.14) -
        (_waist * 0.157) -
        (_hip * 0.249) +
        (_forearm * 0.434);

    var _bodyFat = _bodyWeight - _leanBody;
    var _bodyFatPerc = (_bodyFat * 100) ~/ _bodyWeight;
    var _status;
    if (_bodyFatPerc >= 30) {
      _status = "Obese";
    } else if (_bodyFatPerc >= 22) {
      _status = "Average";
    } else if (_bodyFatPerc < 22) {
      _status = "Fit";
    }
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Your Body Fat Percentage: $_bodyFatPerc%'),
              content: Text('Status: $_status'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    List<ListTile> femaleWidgets = [
      ListTile(
        leading: Text(
          'Wrist Measurement',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Theme.of(context).primaryColor),
            decoration: InputDecoration(
              suffix: Text(
                'inches',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            onChanged: (val) {
              _wrist = int.parse(val);
            },
          ),
        ),
      ),
      ListTile(
        leading: Text(
          'Hip Measurement',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Theme.of(context).primaryColor),
            decoration: InputDecoration(
              suffix: Text(
                'inches',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            onChanged: (val) {
              _hip = int.parse(val);
            },
          ),
        ),
      ),
      ListTile(
        leading: Text(
          'Forearm Measurement',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 55),
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Theme.of(context).primaryColor),
            decoration: InputDecoration(
              suffix: Text(
                'inches',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            onChanged: (val) {
              _forearm = int.parse(val);
            },
          ),
        ),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Body Fat Calculator'),
      ),
      // backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(
        margin: EdgeInsets.only(bottom: 200, left: 15, right: 15, top: 100),
        child: ListView(
          children: [
            ListTile(
              //tileColor: Theme.of(context).primaryColor,
              leading: Text(
                'Gender: ',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              title: Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    _gender,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
              trailing: DropdownButton<String>(
                dropdownColor: Colors.black,
                iconSize: 30,
                items: <String>['Male', 'Female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {
                      _gender = value;
                    },
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    // _gender = val;
                    print(_gender);
                  });
                },
              ),
            ),
            ListTile(
              leading: Text(
                'Body Weight',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              title: Container(
                width: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    onChanged: (val) {
                      _bodyWeight = int.parse(val);
                    },
                    decoration: InputDecoration(
                      //hintText: '60.0',
                      suffix: Text(
                        'pounds',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Waist Measurement',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    suffix: Text(
                      'inches',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  onChanged: (val) {
                    _waist = int.parse(val);
                  },
                ),
              ),
            ),
            if (_gender == "Female")
              for (int i = 0; i < femaleWidgets.length; i++) femaleWidgets[i],
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_gender == "Female") {
                      calculateFemale();
                    } else {
                      calculateMale();
                    }
                  },
                  child: Text('Calculate')),
            ),
          ],
        ),
      ),
    );
  }
}
