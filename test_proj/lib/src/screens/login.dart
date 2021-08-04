import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../database.dart';

Map profData ={};

List indiPostData = [];
List allPosts = [];

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String _Email , _password;

  final FirebaseAuth loginInstance = FirebaseAuth.instance;

  final FirebaseAuth signUpInstance = FirebaseAuth.instance;

  late Database db;
  List docs = [];
  initialise(){
    db = Database();
    db.initialise();
    db.read().then((value) => {
      setState(() {
        docs = value;
      })
    });
  }

  ProfData(){
    for (var prof in docs){
      if (_Email== prof['email']){
        profData = prof;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

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
                    hintText: "Username",
                  ),
                  onChanged: (value){
                    _Email = value;
                  },
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
                    hintText: "Password",
                  ),
                    onChanged: (value){
                      _password = value;
                    }
                ),
                // TextField()],
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                color: Colors.blue.shade700,
                              )),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 10),
                    backgroundColor: Colors.blue.shade400,
                  ),
                  onPressed: () async {
                    try{
                      await loginInstance.signInWithEmailAndPassword(email: _Email, password: _password);
                      ProfData();
                      print(docs);
                      print(profData);
                      Navigator.of(context).pushNamed('/home');
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      if (e.code == 'user-not-found') {
                        final emailErrorbar = SnackBar(
                          content: Text("No user found for that email."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(emailErrorbar);
                      } else if (e == 'wrong-password') {
                        final passwordErrorBar = SnackBar(
                          content: Text("Wrong password provided for that user."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(passwordErrorBar);
                      }
                    }
                  },
                  child: Text("Log in",
                      style: TextStyle(
                        color: Colors.white70,
                      )),
                ),
                Container(
                  height: 40,
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
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text("Sign up")),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
