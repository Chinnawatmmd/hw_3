import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hw_3/gameCheck.dart';
import 'package:hw_3/helpers.dart';

class GuessNum extends StatefulWidget {
  const GuessNum({Key? key}) : super(key: key);

  @override
  State<GuessNum> createState() => _GuessNumState();
}

class _GuessNumState extends State<GuessNum> {
  var _input = '';
  var _state = 'ทายเลข 1 ถึง 100';
  var _check = GameCheck();

  void _handleClickedButton(int num) {
    if (num == -2) {
      setState(() {
        _input = '';
      });
    } else if (num == -1) {
      if (_input.length > 0) {
        setState(() {
          _input = _input.substring(0, _input.length - 1);
        });
      }
    } else if (num == -3) {
      if (_input.length > 0) {
        setState(() {
          _state = _check.doGuess(int.parse(_input))!;
          if (!_check.isCorrect) _input = '';
        });
      } else {
        showMyDialog(context);
      }
    } else {
      if (_input.length < 3) {
        setState(() {
          _input = _input + num.toString();
        });
      }
    }
  }

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        //color: Colors.purple[50],
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleClickedButton(num),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          splashColor: Colors.purple[100],
          child: Container(
            alignment: Alignment.center,
            width: 55,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffD8BFD8),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: num >= 0
                ? Text(
                    num.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  )
                : num == -2
                    ? Icon(
                        Icons.clear,
                        color: Colors.purple,
                      )
                    : Icon(
                        Icons.backspace_outlined,
                        color: Colors.purple,
                      ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.3), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 4, // blur radius
                offset: Offset(4, 4), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
              //you can set more BoxShadow() here
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset('images/guess_logo.png',
                            width: 120, height: 110),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'GUESS',
                              style: TextStyle(
                                fontSize: 40,
                                color: Color(0xffDDA0DD),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'THE NUMBER',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                _input,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _state,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              for (var r in [
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9],
                [-2, 0, -1]
              ])
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var c in r) _buildNumberButton(c),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: ElevatedButton(
                  onPressed: () => _handleClickedButton(-3),
                  child: Text(
                    'GUESS',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
