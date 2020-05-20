import 'package:equatable/equatable.dart';
import 'package:truthordare/players/player.dart';

class PlayerState extends Equatable {
  @override
  List<Object> get props => [];
}

class PlayerStateLoadInProgress extends PlayerState {}

class PlayerStateLoadFailed extends PlayerState {}

class PlayerStateLoadSuccess extends PlayerState {
  final List<Player> players;

  PlayerStateLoadSuccess(this.players);

  @override
  List<Object> get props => [players];

  @override
  String toString() => 'TodosLoadSuccess { todos: $players }';
}
