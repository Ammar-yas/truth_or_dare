import 'dart:async';

import 'package:flutter/material.dart';
import 'package:truthordare/common/constants.dart';
import 'package:truthordare/players/players_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 2000),
        () => {Navigator.pushReplacementNamed(context, PlayersScreen.id)});
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: Constants.KBackgroundHeroTag,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(Constants.GradientTopColor),
                      Color(Constants.GradientBottomColor),
                    ]),
              ),
            ),
          ),
          SplashLogo(),
        ],
      ),
    );
  }
}

class SplashLogo extends StatefulWidget {
  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
    return SafeArea(
      child: Center(
        child: FadeTransition(
          opacity: animation,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Image.asset(
              'assets/images/logo_transparent.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
