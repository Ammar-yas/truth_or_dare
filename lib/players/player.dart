import 'package:flutter/cupertino.dart';

class Player {
  String name;
  int _score = 0;

  Player({@required this.name});

  int get score => _score;

  incrementScore() => _score++;
}
