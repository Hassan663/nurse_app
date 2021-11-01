import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'slots.dart';

class Schedule {
  Timestamp? date;
  List<Slots>? slots = <Slots>[];

  Schedule({ this.date, this.slots});

  Schedule.fromDocumentSnapshot(Map<String, dynamic> json) {
    try {
      Iterable slotsArray = json['slots'];
      date = json['date'];
      slots = slotsArray.map((e) => Slots.fromDocumentSnapshot(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Map<String, dynamic> toJson() => {"date": date, "slots": slots};
}
