import 'package:flutter/material.dart';
import '../auth_gate.dart';

class LoginStartScreen extends StatelessWidget {
  const LoginStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            _rowOfCircles(),
            _titleDescription(),
            getImageAsset('./assets/images/shooting_affirmation.png'),
            _startingWelcomeDescription(),
            largeButton('Get Started!', context),
          ],
        ),
        backgroundColor: Colors.blueGrey.shade300);
  }

  //Public methods
  Widget getImageAsset(String path) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Image.asset(path),
    );
  }

  Widget largeButton(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35.0),
      child: TextButton(
        // ignore: deprecated_member_use
        style: TextButton.styleFrom(
            primary: const Color.fromRGBO(238, 244, 237, 1.0),
            elevation: 5,
            backgroundColor: const Color.fromARGB(255, 143, 106, 124),
            textStyle: const TextStyle(
              fontSize: 30,
            ),
            padding: const EdgeInsets.all(20.0),
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => AuthGate())));
        },
        child: Text(text),
      ),
    );
  }

  //Private methods
  Widget _startingWelcomeDescription() {
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Welcome, Agent. To your Affirmations App!',
            style: TextStyle(
              color: Color.fromRGBO(11, 37, 69, 1.0),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Everyday you will receive an Affirmation and a Mission only Agents of your Double-O-Health can do. Get Started to Create an Account!',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _titleDescription() {
    return const Text(
      'Agent Affirmations',
      style: TextStyle(
        color: Color.fromRGBO(238, 244, 237, 1.0),
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _rowOfCircles() {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _circleCreation(Colors.lightBlue.shade200),
            _circleCreation(Colors.lightGreen.shade200),
            _circleCreation(Colors.yellow.shade200),
          ]),
    );
  }

  Widget _circleCreation(Color colorSelection) {
    return Container(
      height: 75,
      width: 75,
      margin: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(color: colorSelection, shape: BoxShape.circle),
    );
  }
}
