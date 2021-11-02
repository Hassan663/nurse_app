import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/controllers/authentication/auth_controller.dart';
import 'package:rtt_nurse_app/models/appointment/available_requests.dart';

class AppointmentDatabase {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();

  Stream<List<AvailableRequests>> getAllPost() {
    return _fireStore
        .collection('pending-request')
        .where("nurseId", isEqualTo: authController.currentUser.value.uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      List<AvailableRequests> retVal = <AvailableRequests>[];
      snapshot.docs.forEach((element) {
        retVal.add(AvailableRequests.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
