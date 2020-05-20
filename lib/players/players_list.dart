import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truthordare/common/loading_indicator.dart';
import 'package:truthordare/players/bloc/player_bloc_barrel.dart';
import 'package:truthordare/players/player.dart';

class PlayersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayersBloc, PlayerState>(builder: (context, state) {
      if (state is PlayerStateLoadInProgress) return LoadingIndicator();
      if (state is PlayerStateLoadSuccess)
        return PlayersListView(players: state.players);
      return null; //TODO should be removed
    });
  }
}

class PlayersListView extends ListView {
  final List<Player> players;

  PlayersListView({@required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (buildContext, index) {
        final player = players[index];
        return PlayerListItem(player);
      },
    );
  }
}

class PlayerListItem extends StatelessWidget {
  final Player player;

  PlayerListItem(this.player);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(player.name),
    );
  }
}
