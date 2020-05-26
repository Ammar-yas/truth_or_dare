import 'package:equatable/equatable.dart';
import 'package:truthordare/players/player.dart';

class PlayersState extends Equatable {
  @override
  List<Object> get props => [];
}

class PlayerStateLoadInProgress extends PlayersState {}

class PlayerStateLoadFailed extends PlayersState {}

class PlayersStateLoadSuccess extends PlayersState {
  final List<Player> players;

  PlayersStateLoadSuccess(this.players);

  @override
  List<Object> get props => [players];

  @override
  String toString() => 'TodosLoadSuccess { todos: $players }';
}
