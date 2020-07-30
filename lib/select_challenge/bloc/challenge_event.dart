import 'package:equatable/equatable.dart';

class ChallengeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDareEvent extends ChallengeEvent {
  final List<String> askedDaresIds;

  GetDareEvent(this.askedDaresIds);

  @override
  List<Object> get props => [askedDaresIds];
}

class GetTruthEvent extends ChallengeEvent {
  final List<String> askedTruthids;

  GetTruthEvent(this.askedTruthids);

  @override
  List<Object> get props => [askedTruthids];
}
