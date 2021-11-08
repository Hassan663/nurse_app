
import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
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
  TextEditingController controller = TextEditingController();

  bool isLoading = true;

  @override
  void onInit() async {
    await initEngine();
    update();
    super.onInit();
  }

  @override
  void onReady() async {
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
    this.addListeners();
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
        update();
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
    if (defaultTargetPlatform == TargetPlatform.fuchsia) {
      await [Permission.microphone, Permission.camera].request();
    }
    await engine.joinChannel(config.token, channelId, null, config.uid);
  }

  leaveChannel() async {
    await engine.leaveChannel();
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


}
