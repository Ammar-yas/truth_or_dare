import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truthordare/players/bloc/player_bloc.dart';
import 'package:truthordare/players/bloc/player_bloc_barrel.dart';
import 'package:truthordare/players/players_screen.dart';
import 'package:truthordare/select_challenge/select_challenge_screen.dart';
import 'package:truthordare/splash/splash_screen.dart';
import 'package:truthordare/truth_or_dare/truth_or_dare_screen.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PlayersBloc();
      },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          PlayersScreen.id: (context) => PlayersScreen(),
          SelectChallengeScreen.id: (context) => SelectChallengeScreen(),
          TruthOrDareScreen.id: (context) => TruthOrDareScreen(),
        },
        initialRoute: SplashScreen.id,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
