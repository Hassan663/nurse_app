import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rtt_nurse_app/models/appointment/available_appointments.dart';

class AppointmentDatabase {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<List<AvailableAppointments>> getAllPost() {
    return _fireStore
        .collection('available-appointments')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      List<AvailableAppointments> retVal = <AvailableAppointments>[];
      snapshot.docs.forEach((element) {
        retVal.add(AvailableAppointments.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
