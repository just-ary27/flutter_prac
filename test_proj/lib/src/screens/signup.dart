import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:test_proj/src/database.dart';
import 'package:test_proj/src/screens/login.dart';

import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  late String _Email , _password, _cpassword, _username;

  String defaultdp = "https://firebasestorage.googleapis.com/v0/b/instacloneproj.appspot.com/o/globals%2Fdefault_avatar.jpg?alt=media&token=6ce0405e-2bb3-492a-aec6-75866a0775d1";

  final FirebaseAuth signUpInstance = FirebaseAuth.instance;

  late Database db;

  List docs = [];

  initialise(){
    db = Database();
    db.initialise();
  }
  contentLoader(){
    db.read().then((value) => {
      setState(() {
        docs = value;
      })
    });
  }

  ProfData(){
    for (var prof in docs){
      print(prof);
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
                    labelText: "Username",
                  ),
                  onChanged: (value){
                    _username=value;
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
                    _password=value;
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
                    labelText: "Confirm Password",
                  ),
                  onChanged: (value){
                    _cpassword=value;
                  },
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
                    hintText: "Email ID",
                  ),
                  onChanged: (value){
                    _Email= value;
                  },
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
                  onPressed: () async {
                    try {
                      if (_cpassword==_password){
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _Email,
                          password: _password,
                        );
                        db.create(_username,_Email,defaultdp);
                        Future.delayed(Duration(seconds: 10));
                        contentLoader();
                        ProfData();
                        print(profData);
                        Navigator.of(context).pushNamed('/home');
                      }else{
                        final passwordCheck = SnackBar(
                          content: Text("Passwords don't match"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(passwordCheck);
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        final weakPasswordE = SnackBar(
                          content: Text("The password provided is too weak."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(weakPasswordE);
                      } else if (e.code == 'email-already-in-use') {
                        final AccountExi = SnackBar(
                          content: Text("The account already exists for that email."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(AccountExi);
                      }
                    } catch (e) {
                      print(e);
                    }
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
          )
      ),
    );
  }
}
