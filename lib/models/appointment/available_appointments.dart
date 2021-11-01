import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rtt_nurse_app/models/appointment/schedule.dart';

class AvailableAppointments {
  String? uid;
  String? nurseId;
  Schedule? schedule;
  Timestamp? createdAt;

  AvailableAppointments(
      {this.uid, this.nurseId, this.schedule, this.createdAt});

  AvailableAppointments.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    nurseId = doc['nurseId'];
    schedule = Schedule.fromDocumentSnapshot(doc['schedule']);
    createdAt = doc['createdAt'];
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'nurseId': nurseId,
        "schedule": schedule,
        "createdAt": createdAt
      };
}
