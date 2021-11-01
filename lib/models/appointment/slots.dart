import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Slots {
  String? startSlot;
  String? endSlot;

  Slots({
    this.startSlot,
    this.endSlot,
  });

  Slots.fromDocumentSnapshot(Map<String, dynamic> json) {
    startSlot = json['startSlot'];
    endSlot = json['endSlot'];
  }

  Map<String, dynamic> toJson() => {'startSlot':startSlot, 'endSlot':endSlot };
}

