
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDashboardController extends GetxController with WidgetsBindingObserver{


  final nurse = FirebaseFirestore.instance.collection("nurse");

  @override
  void onInit() {
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {

    super.onClose();
  }

  void setStatus(String status) async {
    await nurse.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("online");
    } else {
      // offline
      setStatus("offline");
    }
  }


}