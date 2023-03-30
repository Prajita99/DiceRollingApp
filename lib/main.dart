import 'package:flutter/material.dart';
import 'dart:math'; //for random number generation

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget { 
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
int leftDiceNumber = 1; //avoid using var for type safety
int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    void changeDiceFace() => setState(() {
                  leftDiceNumber = Random().nextInt(6) + 1; //0-5 prints initially so adding 1 will avoid getting a 0
                  rightDiceNumber = Random().nextInt(6) + 1;
                },
              );  

    return Center(
      child: Row(
        children: [
          Expanded( //to not hardcode and manage space for all screen sizes
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              } ,
              child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
        ],
      ),
    );
  }
}
