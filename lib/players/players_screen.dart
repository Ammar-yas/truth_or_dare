import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truthordare/common/constants.dart';
import 'package:truthordare/players/bloc/player_bloc_barrel.dart';
import 'package:truthordare/players/player.dart';
import 'package:truthordare/players/players_list.dart';
import 'package:truthordare/select_challenge/select_challenge_screen.dart';

class PlayersScreen extends StatelessWidget {
  static const String id = "PlayerScreen";

  @override
  Widget build(BuildContext context) {
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
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(Constants.GradientTopColor),
                      Color(Constants.GradientBottomColor),
                    ]),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100,
                    child: PlayersList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Player Name",
                      suffixIcon: Icon(Icons.person_add),
                    ),
                    onSubmitted: (name) => BlocProvider.of<PlayersBloc>(context)
                        .add(AddPlayerEvent(Player(name: name))),
                  ),
                ),
                RaisedButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      SelectChallengeScreen.id,
                      arguments: 0,
                    )
                  },
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Next', style: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
