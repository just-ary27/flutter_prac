import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/launch');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Instagram",
                  style: TextStyle(fontSize: 40, fontFamily: "Billabong"),
                ),
                Container(
                  height: 45,
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // border
                    labelText: "Username",
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.grey.shade700,
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    labelText: "Password",
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.grey.shade700,
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    labelText: "Confirm Password",
                  ),
                ),
                Container(
                  height: 10,
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.grey.shade700,
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    labelText: "Email ID",
                  ),
                ),
                // TextField()],
                Container(
                  height: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 15),
                      backgroundColor: Colors.blue.shade400,
                      textStyle: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Container(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Divider(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Text("OR"),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ]),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: Text("Log in"))
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
