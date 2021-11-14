

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QueueController extends GetxController{

  final patientAppointment = FirebaseFirestore.instance.collection("Appoinments");
  bool isSelected = true;

  List appoinmentlist = [];

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    getAppoinments();
    super.onReady();
  }

  @override
  void onClose() {

    super.onClose();
  }


  Future<void> getAppoinments() async
  {
    Stream<QuerySnapshot> streambodytarget = patientAppointment.snapshots();
    await streambodytarget.forEach((e) {
      appoinmentlist.clear();
      for (var value in e.docs) {
        print(value.data());
        appoinmentlist.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }

}