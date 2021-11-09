
import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rtt_nurse_app/controllers/help/config.dart' as config;

class HelpController extends GetxController {

  late final RtcEngine engine;
  String channelId = config.channelId;
  bool isJoined = false, switchCamera = true, switchRender = true;
  List<int> remoteUid = [];

  bool isLoading = true;

  TextEditingController? controller;
  TextEditingController message = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance.collection("Chat");
  final chatgroup = FirebaseFirestore.instance.collection("ChatGroup");
  List messagelist = [];
  var id = "12";

  @override
  void onInit() async{
    controller = TextEditingController(text: channelId);
    // if (Get.arguments != null) {
    //   print(id);
    //   id = "12";
    //   // id = Get.arguments;
    //   getMessage(id.toString());
    // }
    await initEngine();
    getMessage(id.toString());
    super.onInit();
  }

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  void onClose() {
    engine.destroy();
    super.onClose();
  }

  initEngine() async {
    engine = await RtcEngine.createWithContext(RtcEngineContext(config.appId));
    addListeners();

    await engine.enableVideo();
    await engine.startPreview();
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await engine.setClientRole(ClientRole.Broadcaster);
  }

  addListeners() {
    engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        log('joinChannelSuccess ${channel} ${uid} ${elapsed}');
        isJoined = true;
        update();
      },
      userJoined: (uid, elapsed) {
        log('userJoined  ${uid} ${elapsed}');
        remoteUid.add(uid);

      },
      userOffline: (uid, reason) {
        log('userOffline  ${uid} ${reason}');
        remoteUid.removeWhere((element) => element == uid);
        update();
      },
      leaveChannel: (stats) {
        log('leaveChannel ${stats.toJson()}');
        isJoined = false;
        remoteUid.clear();
        update();
      },
    ));
  }

  joinChannel() async {
    // if (defaultTargetPlatform == TargetPlatform.fuchsia) {
    //   await [Permission.microphone, Permission.camera].request();
    // }
    print("join Function");
    await engine.joinChannel(config.token, channelId, null, config.uid);
  }

  leaveChannel() async {
    print("Leave Function");
    engine.destroy();
    await engine.leaveChannel();
    isJoined = false;
    update();
  }

  switchCameras() {
    engine.switchCamera().then((value) {
      switchCamera = !switchCamera;
      update();
    }).catchError((err) {
      log('switchCamera $err');
    });
  }

  switchRenders() {
    switchRender = !switchRender;
    remoteUid = List.of(remoteUid.reversed);
    update();
  }

  Future<void> getMessage(String rid) async {
    print(rid);
    Stream<QuerySnapshot> streambodytarget = firestoreInstance
        .where("docId", isEqualTo: rid)
        .orderBy("createdAt", descending: true)
        .snapshots();
    await streambodytarget.forEach((e) {
      messagelist.clear();
      for (var value in e.docs) {
        print(value.data());
        messagelist.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);

    });
  }
  Future<void> sendmessage() async {
    print(id);
    await firestoreInstance.add({
      "senderid": firebaseAuth.currentUser!.uid,
      "type": "text",
      "docId": "12",
      // "docId": id,
      "message": message.text,
      "sendername": "Hamza",
      "createdAt": Timestamp.now(),
    }).then((value) {
      message.clear();
      print("message send");
    });
  }



  // late final RtcEngine engine;
  // String channelId = config.channelId;
  // bool isJoined = false, switchCamera = true, switchRender = true;
  // List<int> remoteUid = [];
  // TextEditingController controller = TextEditingController();
  // TextEditingController message = TextEditingController();
  //
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // final firestoreInstance = FirebaseFirestore.instance.collection("Chat");
  // final chatgroup = FirebaseFirestore.instance.collection("ChatGroup");
  // var id;
  // List messagelist = [];
  //
  // bool isLoading = true;
  //
  // @override
  // void onInit() async {
  //   if (Get.arguments != null) {
  //     print(id);
  //     id = "12";
  //     // id = Get.arguments;
  //     getMessage(id.toString());
  //   }
  //   await initEngine();
  //   update();
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() async {
  //   isLoading = false;
  //   update();
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   engine.destroy();
  //   super.onClose();
  // }
  //
  // Future<void> getMessage(String rid) async {
  //   print(rid);
  //   Stream<QuerySnapshot> streambodytarget = firestoreInstance
  //       .where("docId", isEqualTo: rid)
  //       .orderBy("createdAt", descending: true)
  //       .snapshots();
  //   await streambodytarget.forEach((e) {
  //     messagelist.clear();
  //     for (var value in e.docs) {
  //       print(value.data());
  //       messagelist.add(value.data());
  //     }
  //     update();
  //   }).catchError((e) {
  //     print(e);
  //
  //   });
  // }
  // Future<void> sendmessage() async {
  //   print(id);
  //   await firestoreInstance.add({
  //     "senderid": firebaseAuth.currentUser!.uid,
  //     "type": "text",
  //     "docId": "12",
  //     // "docId": id,
  //     "message": message.text,
  //     "sendername": "Hamza",
  //     "createdAt": Timestamp.now(),
  //   }).then((value) {
  //     print(id);
  //     chatgroup.doc(id).update({
  //       "recent" : message.text,
  //     }).then((value){
  //       message.clear();
  //       print("message send");
  //     });
  //   });
  // }
  //
  // initEngine() async {
  //   engine = await RtcEngine.createWithContext(RtcEngineContext(config.appId));
  //   this.addListeners();
  //   await engine.enableVideo();
  //   await engine.startPreview();
  //   await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
  //   await engine.setClientRole(ClientRole.Broadcaster);
  // }
  //
  // addListeners() {
  //   print("Listner function");
  //   engine.setEventHandler(RtcEngineEventHandler(
  //     joinChannelSuccess: (channel, uid, elapsed) {
  //       log('joinChannelSuccess ${channel} ${uid} ${elapsed}');
  //       isJoined = true;
  //       update();
  //     },
  //     userJoined: (uid, elapsed) {
  //       log('userJoined  ${uid} ${elapsed}');
  //       remoteUid.add(uid);
  //       update();
  //     },
  //     userOffline: (uid, reason) {
  //       log('userOffline  ${uid} ${reason}');
  //       remoteUid.removeWhere((element) => element == uid);
  //       update();
  //     },
  //     leaveChannel: (stats) {
  //       log('leaveChannel ${stats.toJson()}');
  //       isJoined = false;
  //       remoteUid.clear();
  //       update();
  //     },
  //   ));
  // }
  //
  // joinChannel() async {
  //   if (defaultTargetPlatform == TargetPlatform.fuchsia) {
  //     await [Permission.microphone, Permission.camera].request();
  //   }
  //   await engine.joinChannel(config.token, controller.text, null, config.uid);
  // }
  //
  // leaveChannel() async {
  //   await engine.leaveChannel();
  // }
  //
  // switchCameras() {
  //   engine.switchCamera().then((value) {
  //     switchCamera = !switchCamera;
  //     update();
  //   }).catchError((err) {
  //     log('switchCamera $err');
  //   });
  // }
  //
  // switchRenders() {
  //   switchRender = !switchRender;
  //   remoteUid = List.of(remoteUid.reversed);
  //   update();
  // }
  //

}
