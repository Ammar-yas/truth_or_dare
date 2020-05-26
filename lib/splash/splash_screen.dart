import 'dart:async';

import 'package:flutter/material.dart';
import 'package:truthordare/players/players_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1500),
        () => {Navigator.pushReplacementNamed(context, PlayersScreen.id)});
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text("SplashScreen"),
          ),
        ),
      ),
    );
  }
}
