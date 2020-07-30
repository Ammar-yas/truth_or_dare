import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truthordare/common/loading_indicator.dart';
import 'package:truthordare/players/bloc/player_bloc.dart';
import 'package:truthordare/players/bloc/player_bloc_barrel.dart';
import 'package:truthordare/players/player.dart';
import 'package:truthordare/select_challenge/bloc/challenge_bloc.barrel.dart';
import 'package:truthordare/truth_or_dare/truth_or_dare_screen.dart';

class SelectChallengeScreen extends StatelessWidget {
  static const String id = "SelectChallengeScreen";

  @override
  Widget build(BuildContext context) {
    final int _position = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(child: BlocBuilder<PlayersBloc, PlayersState>(
        builder: (context, state) {
          if (state is PlayersStateLoadSuccess) {
            return SelectChallengeWidget(state.players[_position], _position);
          } else {
            return LoadingIndicator();
          }
        },
      )),
    );
  }
}

class SelectChallengeWidget extends StatelessWidget {
  final Player player;
  final int position;

  const SelectChallengeWidget(this.player, this.position);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ChallengeBloc()..add(GetDareEvent(List())),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 200,
          ),
          Text(player.name),
          BlocBuilder<ChallengeBloc, ChallengeState>(builder: (context, state) {
            if (state is! ChallengeStateLoadSuccess) return LoadingIndicator();
            return RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.red),
              ),
              color: Colors.red,
              child: Text(
                'TRUTH 😇',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  TruthOrDareScreen.id,
                  arguments: TruthOrDareScreenArguments(
                    position: position,
                    challenge: (state as ChallengeStateLoadSuccess).challenge,
                  ),
                );
              },
            );
          }),
          RaisedButton(
            child: Text(
              'DARE 😈',
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: Colors.red),
            ),
            color: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
