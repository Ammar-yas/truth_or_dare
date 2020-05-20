import 'package:equatable/equatable.dart';
import 'package:truthordare/players/player.dart';

class PlayerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddPlayerEvent extends PlayerEvent {
  final Player player;
  AddPlayerEvent(this.player);

  @override
  List<Object> get props => [player];
}

class EditPlayerEvent extends PlayerEvent {
  final Player player;
  final int position;
  EditPlayerEvent(this.player, this.position);

  @override
  List<Object> get props => [player];
}

class RemovePlayerEvent extends PlayerEvent {
  final int position;
  RemovePlayerEvent(this.position);

  @override
  List<Object> get props => [position];
}
