import 'package:bmi/calculateRes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCard = 2;

  int sliderValue = 130;

  int age = 22;

  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: Text(
            "BMI CALCULATOR",
            style: GoogleFonts.bebasNeue(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                  letterSpacing: 1.5),
            ),
          ),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              tooltip: "SETTINGS",
            )
          ],
        ),
        body: Column(
          children: [
            // First Row
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = 0;
                        });
                      },
                      // M A L E
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedCard == 0
                                ? Colors.deepPurple[400]
                                : Colors.deepPurple[200]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.mars,
                              size: 99,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "MALE",
                              style: GoogleFonts.bebasNeue(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30,
                                  letterSpacing: 3),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCard = 1;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectedCard == 1
                                ? Colors.deepPurple[400]
                                : Colors.deepPurple[200]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              FontAwesomeIcons.venus,
                              size: 99,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "FEMALE",
                              style: GoogleFonts.bebasNeue(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30,
                                  letterSpacing: 3),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Second row
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple[200]),
                      child: Column(children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "HEIGHT",
                          style: GoogleFonts.bebasNeue(
                            textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              sliderValue.toString(),
                              style: GoogleFonts.bebasNeue(
                                textStyle: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3),
                              ),
                            ),
                            const Text("cm"),
                          ],
                        ),
                        Slider(
                            value: sliderValue.toDouble(),
                            min: 120.0,
                            max: 225.0,
                            onChanged: (value) {
                              setState(() {
                                sliderValue = value.toInt();
                              });
                            }),
                      ]),
                    ),
                  ),
                ],
              ),
            ),

            // Third Row
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple[200],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "WEIGHT",
                            style: GoogleFonts.bebasNeue(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            weight.toString(),
                            style: GoogleFonts.bebasNeue(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                child: const CircleAvatar(
                                  child: Icon(FontAwesomeIcons.plus),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                                child: const CircleAvatar(
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple[200],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "AGE",
                            style: GoogleFonts.bebasNeue(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            age.toString(),
                            style: GoogleFonts.bebasNeue(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                child: const CircleAvatar(
                                  child: Icon(FontAwesomeIcons.plus),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                                child: const CircleAvatar(
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Calculate Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                weight: weight,
                                //age: age,
                                height: sliderValue,
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(22)),
                  child: Center(
                      child: Text(
                    "CALCULATE",
                    style: GoogleFonts.bebasNeue(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 1.5)),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
