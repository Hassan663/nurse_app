

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/constants/custom_snackbar.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/controllers/help/help_controller.dart';

class QueueController extends GetxController{

  final patientAppointment = FirebaseFirestore.instance.collection("Appoinments");
  final client = FirebaseFirestore.instance.collection("client");
  bool isSelected = true;

  bool isLoading = true;

  late HelpController helpController;

  List appoinmentlist = [];
  List appoinmentlist1 = [];

  @override
  void onInit() {
    if (Get.isRegistered<HelpController>())
    helpController = Get.find<HelpController>();
    else
    helpController = Get.put(HelpController());
    super.onInit();
  }

  @override
  void onReady() {
    getAppoinments();
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  void onClose() {

    super.onClose();
  }


  Future<void> getAppoinments() async
  {

    Stream<QuerySnapshot> streambodytarget = patientAppointment.where("status" , isEqualTo: "pending").snapshots();
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

  Future<void> getCompleteAppoinments() async
  {
    Stream<QuerySnapshot> streambodytarget = patientAppointment.where("status" , isEqualTo: "done").snapshots();
    await streambodytarget.forEach((e) {
      appoinmentlist1.clear();
      for (var value in e.docs) {
        print(value.data());
        appoinmentlist1.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> acceptAppoinment(String docid) async{
    print("check Function $docid");
    isLoading = true;
    update();
    var cdata = await patientAppointment.doc(docid).get();
    print(cdata.data());
    var patientid = cdata.data()!['patientId'];
    print(patientid);
    var pdata = await client.doc(patientid).get();
    if(pdata.data()!['status'].toString().toLowerCase() == "online")
      {
        await  patientAppointment.doc(docid).update({
          "status" : "done",
          "nurseId" : FirebaseAuth.instance.currentUser!.uid
        }).then((value) {
          isLoading = true;
          isSelected = false;
          update();
        });
      }
    else
      {
        isLoading = false;
        update();
        CustomSnackBar.showSnackBar(
            title: "Error",
            message: 'Sorry This patient is not online',
            backgroundColor: snackBarError);
      }
  }

}