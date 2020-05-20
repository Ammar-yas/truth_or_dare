import 'dart:async';

import 'package:flutter/material.dart';
import 'package:truthordare/truth_or_dare/truth_or_dare_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1500),
        () => {Navigator.pushReplacementNamed(context, TruthOrDareScreen.id)});
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
