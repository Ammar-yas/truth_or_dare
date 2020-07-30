import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truthordare/common/loading_indicator.dart';
import 'package:truthordare/players/bloc/player_bloc.dart';
import 'package:truthordare/players/bloc/player_bloc_barrel.dart';
import 'package:truthordare/players/player.dart';
import 'package:truthordare/players/players_screen.dart';
import 'package:truthordare/select_challenge/challenge.dart';
import 'package:truthordare/select_challenge/select_challenge_screen.dart';

class TruthOrDareScreen extends StatelessWidget {
  static const String id = "TruthOrDareScreen";

  @override
  Widget build(BuildContext context) {
    final TruthOrDareScreenArguments arguments =
        ModalRoute.of(context).settings.arguments;
    final Challenge challenge = arguments.challenge;
    final int position = arguments.position;

    return BlocBuilder<PlayersBloc, PlayersState>(
      builder: (context, state) {
        if (state is PlayersStateLoadSuccess) {
          return TruthOrDareWidget(state.players, position, challenge);
        }
        return LoadingIndicator();
      },
    );
  }
}

class TruthOrDareWidget extends StatelessWidget {
  final List<Player> players;
  final int position;
  final Challenge challenge;

  const TruthOrDareWidget(this.players, this.position, this.challenge);

  @override
  Widget build(BuildContext context) {
    final player = players[position];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(player.name),
            Text(challenge.value),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () =>
                      _onCompleteChallengeClicked(player, position, context),
                  child: Text('✅'),
                ),
                FlatButton(
                  onPressed: () => _goToNextScreen(context),
                  child: Text('❌'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onCompleteChallengeClicked(
      Player player, int position, BuildContext context) {
    _incrementPlayerScore(player, position, context);
    _goToNextScreen(context);
  }

  void _incrementPlayerScore(
      Player player, int position, BuildContext context) {
    BlocProvider.of<PlayersBloc>(context).add(
      EditPlayerEvent(
        player..incrementScore(),
        position,
      ),
    );
  }

  void _goToNextScreen(BuildContext context) {
    final int nextPosition = position + 1;
    if (players.length - nextPosition == 0) {
      Navigator.pushNamed(context, PlayersScreen.id);
    } else {
      Navigator.pushNamed(context, SelectChallengeScreen.id,
          arguments: nextPosition);
    }
  }
}

class TruthOrDareScreenArguments {
  final Challenge challenge;
  final int position;

  TruthOrDareScreenArguments({
    @required this.challenge,
    @required this.position,
  });
}
