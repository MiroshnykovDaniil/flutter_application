import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color_randomiser.dart';
import 'dart:math';
// Creating new widget
class HomePage extends StatefulWidget{
  HomePage({Key key}) : super (key:key);
  @override
  _HomePageState createState() => new _HomePageState();
}
// Widget state
class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  ColorGenerator colorRandomiser = new ColorGenerator();
  Color color = new Color.fromARGB(255, 1, 255, 1);
  double positionBottom = 0;
  double positionRight = 0;
  double positionTop = 100;
  String res = "Lest play some game. You just need to press button. \r\n Rule is simple: you miss - you lose";

  // Changing state according to the background color
  void _changeColor() {
    setState(() {
      color = colorRandomiser.generateColor();
      res = "missed (^_^) ";
    });
  }
  // This game was made for you. Have fun.
  Random random = new Random();
  void _game() {
    setState(() {
      res = "Ok. You`re accurate buddy, but you won't win next time!!!";
      positionBottom = random.nextInt(400).toDouble();
      positionRight = random.nextInt(300).toDouble();
      positionTop = random.nextInt(300).toDouble();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: GestureDetector(
        onTap: _changeColor,
        child: Container(
          color: color,
          child: Center(
            child: Text(
              "Hey there ",
              style: TextStyle(
                  decoration: TextDecoration.none
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(res),
          ),
        leading: IconButton(
          icon: Icon(Icons.apps),
          onPressed: () => _key.currentState.openDrawer(),
          ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: positionBottom, right: positionRight),
          child: FloatingActionButton(
            onPressed: _game,
            child: Icon(Icons.gamepad),
            mini: true,
          )
      ),
      drawer: new Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: positionTop, right: positionRight),
              child: FloatingActionButton(
                child: Icon(Icons.toys),
                backgroundColor: color,
                onPressed: _game,
              ),
            ),
          ],
        ),
      ),
    );
  }
}