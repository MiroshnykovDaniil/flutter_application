import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colorRandomiser.dart';
import 'dart:math';
// Creating new widget
class HomePage extends StatefulWidget{
  HomePage({Key key}) : super (key:key);
  @override
  _HomePageState createState() => new _HomePageState();

}
// Widget state
class _HomePageState extends State<HomePage>{
  ColorGenerator colorRandomiser = new ColorGenerator();
  Color color = new Color.fromARGB(255, 1, 255, 1);
  double positionBottom = 0;
  double positionRight = 0;
  String res="Lest play some game. You just need to press button. \r\n Rule is simple: you miss - you lose";
  // Changing state according to the background color
  void _changeColor(){
    setState((){
      color = colorRandomiser.generateColor();
      res="missed (^_^) ";
        });
  }

  // This game was made for you. Have fun.
  Random random = new Random();
  void _game(){
    setState(() {
      res = "Ok. You`re accurate buddy, but you won't win next time!!!";
      positionBottom = random.nextInt(400).toDouble();
      positionRight = random.nextInt(300).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector is needed to handle taps
    Widget home = new GestureDetector(
      onTap: _changeColor,
      child:Scaffold(
        backgroundColor: color,
        body: Container(
          // We use Row and Column here to place text in center of the screen: row for vertically, then column for horizontally
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Hey there"),
                  Text(res),
                ],
              )
            ],
          ),
        ),

        // "Buttons are not for games", they sayin'.
        // "Try this" - we answer.
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: positionBottom, right: positionRight),
          child :FloatingActionButton(
            onPressed: _game,
            child: Icon(Icons.gamepad),
            mini: true,
          )
        ),
      ),
    );
    return home;
  }
}