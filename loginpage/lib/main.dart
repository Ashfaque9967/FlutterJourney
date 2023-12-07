import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceInOut);
    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    primarySwatch: Colors.green,
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.amber,
                        fontSize: 20.0
                      )
                    )
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                         TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        const MaterialButton(
                          color: Colors.blueAccent, 
                          onPressed: _void,
                          textColor: Colors.white,
                          child: Text("Login"),
                          splashColor: Colors.blueAccent,
                        )
                      ],
                    ),
                  ),
                ))
            ],
          ),
        ],
      ),
    );
  }
}

_void() {
}
