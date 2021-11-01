import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/constants/custom_snackbar.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/controllers/authentication/auth_controller.dart';
import 'package:rtt_nurse_app/models/authentication/auth_model.dart';
import 'package:rtt_nurse_app/models/authentication/schedule.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();

  Future<bool> createUserInDatabase(AuthModel user) async {
    try {
      await _firestore.collection('nurse').doc(user.uid).set({
        'uid': user.uid,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'imageUrl': user.imageUrl,
        'createdAt': user.createdAt,
        'role': user.role,
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> createAppoitmentInDatabase(Schedule schedule) async {
    try {
      Timestamp currentTime = Timestamp.now();
      await _firestore.collection('available-appointments').doc().set({
        "nurseId": authController.currentUser.value.uid,
        "schedule": schedule.toJson(),
        "createdAt": Timestamp.now()
      });
      createAppointmentInNurseCollection(schedule, currentTime);
      CustomSnackBar.showSnackBar(
          title: "Appoitment successfully created",
          message: '',
          backgroundColor: snackBarSuccess);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> createAppointmentInNurseCollection(
      Schedule schedule, Timestamp currentTime) async {
    try {
      await _firestore
          .collection('nurse')
          .doc(authController.currentUser.value.uid)
          .collection('appointments')
          .doc()
          .set({
        "nurseId": authController.currentUser.value.uid,
        "schedule": schedule.toJson(),
        "createdAt": currentTime
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<AuthModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("nurse").doc(uid).get();
      if (!doc.exists) {
        CustomSnackBar.showSnackBar(
            title: "Not Authorized",
            message: '',
            backgroundColor: snackBarError);
      }
      return AuthModel.fromDocumentSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
