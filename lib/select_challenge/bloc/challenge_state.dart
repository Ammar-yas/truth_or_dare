import 'package:equatable/equatable.dart';

import '../challenge.dart';

class ChallengeState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChallengeStateLoadInProgress extends ChallengeState {}

class ChallengeStateLoadFailed extends ChallengeState {
  final dynamic error;

  ChallengeStateLoadFailed(this.error);

  @override
  List<Object> get props => [error];
}

class ChallengeStateLoadSuccess extends ChallengeState {
  final Challenge challenge;

  ChallengeStateLoadSuccess(this.challenge);

  @override
  List<Object> get props => [challenge];
}
