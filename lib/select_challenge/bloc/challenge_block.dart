import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:truthordare/common/constants.dart';
import 'package:truthordare/select_challenge/bloc/challenge_bloc.barrel.dart';
import 'package:truthordare/select_challenge/challenge.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  //TODO: Database implementation should be implemented in repository.
  final Firestore database = Firestore.instance
    ..settings(persistenceEnabled: true);

  @override
  // TODO: implement initialState + database casheing
  ChallengeState get initialState => ChallengeStateLoadInProgress();

  @override
  Stream<ChallengeState> mapEventToState(ChallengeEvent event) async* {
    if (event is GetDareEvent) {
      yield* _mapGetDareToState(event);
    } else if (event is GetTruthEvent) {
      yield* _mapGetTruthToState(event);
    }
  }

  //TODO: fetching Truth or dare methods need to be cleaned and optlimized

  Stream<ChallengeState> _mapGetDareToState(GetDareEvent event) async* {
    Stream<QuerySnapshot> snapShots = database
        .collection(Constants.kDaresCollectionName)
        .getDocuments()
        .catchError(onFireStoreError)
        .asStream();
    await for (final snapshot in snapShots) {
      final unAskedDares = snapshot.documents
        ..removeWhere((element) {
          return event.askedDaresIds.contains(element.documentID);
        });
      if (unAskedDares.isEmpty) {
        final emptyDare = Challenge(value: "you have completed all dares");
        yield ChallengeStateLoadSuccess(emptyDare);
      }
      final randomDare =
          unAskedDares[Random().nextInt(unAskedDares.length)].asChallenge();
      yield ChallengeStateLoadSuccess(randomDare);
    }
  }

  Stream<ChallengeState> _mapGetTruthToState(GetTruthEvent event) async* {
    Stream<QuerySnapshot> snapShots = database
        .collection(Constants.kTruthCollectionName)
        .getDocuments()
        .catchError(onFireStoreError)
        .asStream();
    await for (final snapshot in snapShots) {
      final unaskedTruth = snapshot.documents
        ..removeWhere((element) {
          return event.askedTruthids.contains(element.documentID);
        });
      if (unaskedTruth.isEmpty) {
        final emptyDare = Challenge(value: "you have completed all truth");
        yield ChallengeStateLoadSuccess(emptyDare);
      }
      final randomDare =
          unaskedTruth[Random().nextInt(unaskedTruth.length)].asChallenge();
      yield ChallengeStateLoadSuccess(randomDare);
    }
  }

  void onFireStoreError(dynamic error, StackTrace stackTrace) {
    Logger().e(
        "Error while getting '${Constants.kDaresCollectionName}' collection",
        error,
        stackTrace);
    Crashlytics.instance.recordError(error, stackTrace);
  }
}
