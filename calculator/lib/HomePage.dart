// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSubtraction() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doMultiplication() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDivition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      if (num2 != 0) {
        sum = num1 ~/ num2;
      } else {
        sum = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calc."),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter number", hintStyle: TextStyle(
                color: Colors.blueGrey,
              )),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter number", hintStyle: TextStyle(
                color: Colors.blueGrey,
              )),
              controller: t2,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Output: $sum",
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: doAddition,
                  child: const Text("+"),
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: doSubtraction,
                  child: const Text("-"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: doMultiplication,
                  child: const Text("*"),
                ),
                MaterialButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: doDivition,
                  child: const Text("/"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
