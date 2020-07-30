import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _ageController=new TextEditingController();
  final TextEditingController _heightController=new TextEditingController();
  final TextEditingController _weightController=new TextEditingController();
  double inches=0.0;
  double result=0.0;
  String str="";
  void _calBmi()
  {
    setState(() {
      int age=int.parse(_ageController.text);
      double height=double.parse(_heightController.text);
      double weight=double.parse(_weightController.text);
      inches= height*12;
      if((_ageController.text.isNotEmpty||age>0) && (_heightController.text.isNotEmpty||inches>0)&&(_weightController.text.isNotEmpty||weight>0))
        {
          result=weight/(inches*inches)*703;
          if(double.parse(result.toStringAsFixed(1))<18.5)
            {
              str="underweight";
            }
          else if(double.parse(result.toStringAsFixed(1))>=18.5&&result<25)
            {
              str="good shape";
            }
          else
            {
              str="overweight";
            }
        }
      else
        {
          result=0.0;
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              height: 95.0,
              width: 85.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 265.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "e.g:34",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Heigt in Feet",
                      hintText: "e.g:6.4",
                      icon: new Icon(Icons.insert_chart),
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight in lbs",
                      hintText: "e.g:160",
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: _calBmi,
                      color: Colors.pinkAccent,
                      child: new Text("calculate"),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Bmi:${result.toStringAsFixed(1)}",
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                  ),

                ),
                new Text(
                  "condition:$str",
                  style: new TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                  ),

                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
