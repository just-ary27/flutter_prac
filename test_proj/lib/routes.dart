import 'package:flutter/material.dart';
import 'package:test_proj/src/screens/activity.dart';
import 'package:test_proj/src/screens/dm.dart';
import 'package:test_proj/src/screens/home.dart';
import 'package:test_proj/src/screens/launch.dart';
import 'package:test_proj/src/screens/login.dart';
import 'package:test_proj/src/screens/profile.dart';
import 'package:test_proj/src/screens/search.dart';
import 'package:test_proj/src/screens/signup.dart';

class RouteGenerator{
  static Route<dynamic> generate(RouteSettings settings){
    switch(settings.name){
      case "/dm":
        return MaterialPageRoute(builder: (_) => DMScreen());
      case "/launch":
        return MaterialPageRoute(builder: (_) => LaunchScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/search":
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case "/activity":
        return MaterialPageRoute(builder: (_) => ActivityScreen());
      case "/profile":
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case "/signup":
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "/":
        return MaterialPageRoute(builder: (_) => LaunchScreen());
      default:
        return MaterialPageRoute(builder: (_) => LaunchScreen());
    }
  }
}