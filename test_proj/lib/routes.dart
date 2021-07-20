import 'package:flutter/material.dart';
import 'main.dart';

class RouteGenerator{
  static Route<dynamic> generate(RouteSettings settings){
    switch(settings.name){
      case "/DM":
        return MaterialPageRoute(builder: (_) => DMScreen());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "/":
        return MaterialPageRoute(builder: (_) => LaunchScreen());
      default:
        return MaterialPageRoute(builder: (_) => LaunchScreen());
    }
  }
}