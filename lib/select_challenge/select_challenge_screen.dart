import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truthordare/common/loading_indicator.dart';
import 'package:truthordare/players/bloc/player_bloc.dart';
import 'package:truthordare/players/bloc/player_bloc_barrel.dart';

class SelectChallengeScreen extends StatelessWidget {
  static const String id = "SelectChallengeScreen";

  @override
  Widget build(BuildContext context) {
    final int _position = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
            ),
            BlocBuilder<PlayersBloc, PlayersState>(builder: (context, state) {
              if (state is PlayersStateLoadSuccess) {
                return Text(state.players[_position].name);
              } else {
                return LoadingIndicator();
              }
            }),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.red),
              ),
              color: Colors.red,
              child: Text(
                'TRUTH 😇',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
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
      ),
    );
  }
}
