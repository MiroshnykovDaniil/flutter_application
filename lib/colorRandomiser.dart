import 'dart:math';

import 'package:flutter/cupertino.dart';
/*
  Generating random color
 */
class ColorGenerator{
  Random random = new Random();

  // Generating new Color.
  // We call Random only one time bcs it's cheaper than calling it 3 times ($_^)
  Color generateColor(){
    int randValue = random.nextInt(255);
    return Color.fromARGB(255, randValue,  (randValue-100).abs(), (randValue-255).abs());
  }
}