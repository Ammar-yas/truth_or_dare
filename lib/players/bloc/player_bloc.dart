import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:truthordare/players/bloc/player_event.dart';
import 'package:truthordare/players/bloc/player_state.dart';

import '../player.dart';

class PlayersBloc extends Bloc<PlayerEvent, PlayerState> {
  List<Player> players;

  PlayersBloc({List<Player> players}) : players = players ?? List();

  @override
  PlayerState get initialState => PlayerStateLoadInProgress();

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is AddPlayerEvent) {
      yield* _mapAddPlayerEventToState(event);
    } else if (event is EditPlayerEvent) {
      yield* _mapEditPlayerEventToState(event);
    } else if (event is RemovePlayerEvent) {
      yield* _mapRemovePlayerEventToState(event);
    }
  }

  Stream<PlayerState> _mapAddPlayerEventToState(AddPlayerEvent event) async* {
    players = players.toList()..add(event.player);
    yield PlayerStateLoadSuccess(players);
  }

  Stream<PlayerState> _mapEditPlayerEventToState(EditPlayerEvent event) async* {
    if (event.position >= 0 && event.position < players.length) {
      players[event.position] = event.player;
    } else {
      Logger().e("Out of bound player position");
    }
    yield PlayerStateLoadSuccess(players);
  }

  Stream<PlayerState> _mapRemovePlayerEventToState(
      RemovePlayerEvent event) async* {
    if (event.position >= 0 && event.position < players.length) {
      players.removeAt(event.position);
    } else {
      Logger().e("Out of bound player position");
    }
    yield PlayerStateLoadSuccess(players);
  }
}
