import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: new Home(),
      theme: ThemeData(
        brightness: Brightness.dark
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String data = "Click me";

  _changeState(){
    setState(() {
      if(data.startsWith("C")){
        data = "I got Clicked";
      }
      else{
        data = "Click me";
      }
    });
  }

  Widget _bodyWidget(){
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data, style: TextStyle(
              fontSize: 20.0,
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        title: Text("Home Page"),
      ),
      body: _bodyWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: _changeState,
      ),
    );
  }
}

