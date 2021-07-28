import 'package:flutter/material.dart';

Map profData = {};

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "Billabong",
                  ),
                ),
                Container(
                  height: 200,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 20),
                      backgroundColor: Colors.blueAccent,
                      side: BorderSide(width: 2, color: Colors.blueAccent)),
                  child: Text("Log in",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      )),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ),
                Container(
                  height: 25,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.blueAccent),
                    minimumSize: Size(double.infinity, 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
