import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:truthordare/common/constants.dart';

class Challenge {
  final String documentId;
  final String value;

  Challenge({@required this.value, this.documentId});
}

extension ChallengeDocument on DocumentSnapshot {
  Challenge asChallenge() {
    return Challenge(
      documentId: documentID,
      value: this[Constants.kChallengeValueKey],
    );
  }
}
