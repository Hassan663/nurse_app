import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rtt_nurse_app/models/appointment/schedule.dart';

class AvailableRequests {
  String? uid;
  String? status;
  String? nurseId;
  String? clientId;
  String? appId;
  String? firstName;
  String? lastName;
  Schedule? schedule;
  Timestamp? reqCreatedAt;
  Timestamp? appCreatedAt;


  AvailableRequests(
      {this.uid,
      this.status,
      this.nurseId,
      this.clientId,
      this.appId,
      this.schedule,
      this.firstName,
      this.lastName,
      this.reqCreatedAt,
      this.appCreatedAt});

  AvailableRequests.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    nurseId = doc['nurseId'];
    status = doc['status'];
    clientId = doc['clientId'];
    firstName = doc['firstName'];
    lastName = doc['lastName'];
    schedule = Schedule.fromDocumentSnapshot(doc['schedule']);
    reqCreatedAt = doc['createdAt'];
    appId = doc['appId'];
    appCreatedAt = doc['appCreatedAt'];
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'nurseId': nurseId,
        'status': status,
        'clientId': clientId,
        'firstName': firstName,
        'lastName': lastName,
        'schedule': schedule!.toJson(),
        'reqCreatedAt': reqCreatedAt,
        'appId': appId,
        'appCreatedAt': appCreatedAt,

      };
}
