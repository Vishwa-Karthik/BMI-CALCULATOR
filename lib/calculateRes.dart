// ignore_for_file: file_names, must_be_immutable

import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formula.dart';

class ResultPage extends StatefulWidget {
  int weight;
  int height;
  //int age;

  ResultPage({super.key, required this.height, required this.weight});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Logic logic = Logic();
  double bmiRes = 0;

  @override
  void initState() {
    bmiRes = logic.calculateBMI(widget.height, widget.weight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurple[100],
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[300],
            title: Text(
              "RESULT",
              style: GoogleFonts.bebasNeue(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                    letterSpacing: 1.5),
              ),
            ),
          ),
          body: Center(
            child: Card(
              color: Colors.deepPurple[200],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.calculator,
                      color: Colors.black,
                    ),
                    title: Text(
                      'YOUR BMI RESULT IS',
                      style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                              letterSpacing: 2)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        bmiRes.toStringAsFixed(2),
                        style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                              letterSpacing: 2),
                        ),
                      ),
                      const SizedBox(
                        width: 105,
                      ),
                      TextButton(
                        child: Text(
                          'RE-CALCULATE',
                          style: GoogleFonts.bebasNeue(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25,
                                  letterSpacing: 2)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
