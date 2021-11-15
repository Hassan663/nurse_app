import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/controllers/help/help_controller.dart';
import 'package:rtt_nurse_app/utils/rrt_sizes.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/header.dart';
import 'package:rtt_nurse_app/widget/commontextfield.dart';
import 'package:screenshot/screenshot.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildContainerHelp(context));
  }

  Widget buildContainerHelp(BuildContext context) {
    Future<dynamic> ShowCapturedWidget(
        BuildContext context, Uint8List capturedImage) {
      return showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Captured widget screenshot"),
          ),
          body: Center(
              child: capturedImage != null
                  ? Image.memory(capturedImage)
                  : Container()),
        ),
      );
    }

    ScreenshotController screenshotController = ScreenshotController();
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Header(),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color:
                    Color(0xffE5E5E5), //new Color.fromRGBO(255, 0, 0, 0.0),
                    borderRadius: new BorderRadius.only(
                        topLeft:
                        Radius.circular(circular_radius_homeContainers),
                        bottomLeft:
                        Radius.circular(circular_radius_homeContainers))),
                child: GetBuilder<HelpController>(
                  init: HelpController(),
                  builder: (_) {
                    return _.isLoading
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : Container(
                      child: Row(
                        children: [
                          Container(
                            color: fLabelTextColor,
                            width: Get.width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width,
                                  child: Row(
                                    children: [],
                                  ),
                                ),
                                renderVideo(_),
                                Container(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          10))),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.videocam_sharp,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          10))),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.mic_none,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          10))),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.chat,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          10))),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.more_vert,
                                                    color: Colors.white,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            CircularButtons(
                                              backgroundColor:
                                              const Color(0xfffc6359),
                                              borderColor:
                                              const Color(0xfffc6359),
                                              text:
                                              '${_.isJoined ? 'Leave' : 'Join'} Session',
                                              height: 50,
                                              width: 150,
                                              onPressed: () {
                                                _.isJoined
                                                    ? _.leaveChannel()
                                                    : _.joinChannel();
                                              },
                                              textColor: Colors.white,
                                              textStyle: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            CircularButtons(
                                              backgroundColor:
                                              const Color(0xfffc6359),
                                              borderColor:
                                              const Color(0xfffc6359),
                                              text: 'Assesment',
                                              height: 50,
                                              width: 150,
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                    context) {
                                                      return AlertDialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.all(Radius.circular(
                                                                  20.0))),
                                                          backgroundColor:
                                                          Colors
                                                              .white,
                                                          content:
                                                          Container(
                                                            height: 300,
                                                            width: 500,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                                Text(
                                                                  'Assesment',
                                                                  style: TextStyle(
                                                                      color:
                                                                      fLabelTextColor,
                                                                      fontSize:
                                                                      25,
                                                                      fontWeight:
                                                                      FontWeight.bold),
                                                                ),
                                                                //SizedBox(height: 5.h),
                                                                Text(
                                                                  "Please indicate the result of the test",
                                                                  style: GoogleFonts.inter(
                                                                      fontSize:
                                                                      18,
                                                                      fontStyle:
                                                                      FontStyle.normal,
                                                                      fontWeight: FontWeight.w600,
                                                                      color: fButtonTextColor),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        _.addResult("Positive");
                                                                          },
                                                                      icon:
                                                                      Icon(
                                                                        Icons.add_circle,
                                                                        size: 50,
                                                                      ),
                                                                      color:
                                                                      fButtonColor,
                                                                    ),
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                            _.addResult("Undecided");
                                                                          },
                                                                      icon:
                                                                      Icon(
                                                                        Icons.help,
                                                                        size: 50,
                                                                      ),
                                                                      color:
                                                                      Color(0xffFFA857),
                                                                    ),
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                            _.addResult("Negative");
                                                                          },
                                                                      icon:
                                                                      Icon(
                                                                        Icons.remove_circle,
                                                                        size: 50,
                                                                      ),
                                                                      color:
                                                                      Color(0xff0B7D2B),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.symmetric(horizontal: 20),
                                                                  child:
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Text("Positive",
                                                                          style: TextStyle(letterSpacing: 1, color: fButtonColor, fontSize: 20, fontWeight: FontWeight.w600)),
                                                                      Text("Undecided",
                                                                          style: TextStyle(letterSpacing: 1, color: Color(0xffFFA857), fontSize: 20, fontWeight: FontWeight.w600)),
                                                                      Text("Negative",
                                                                          style: TextStyle(letterSpacing: 1, color: Color(0xff0B7D2B), fontSize: 20, fontWeight: FontWeight.w600))
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.symmetric(horizontal: 40),
                                                                  child:
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      CircularButtons(
                                                                        backgroundColor: const Color(0xfffc6359),
                                                                        borderColor: const Color(0xfffc6359),
                                                                        text: "Confirm",
                                                                        height: 50,
                                                                        width: MediaQuery.of(context).size.width * 0.1,
                                                                        textColor: Colors.white,
                                                                        textStyle: WhiteText,
                                                                        onPressed: () {
                                                                          Navigator.pop(context);
                                                                        },
                                                                      ),
                                                                      CircularButtons(
                                                                        backgroundColor: const Color(0xfffc6359),
                                                                        borderColor: const Color(0xfffc6359),
                                                                        text: "Cancel",
                                                                        height: 50,
                                                                        width: MediaQuery.of(context).size.width * 0.1,
                                                                        textColor: Colors.white,
                                                                        textStyle: WhiteText,
                                                                        onPressed: () {
                                                                          Navigator.pop(context);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ));
                                                    });
                                              },
                                              textColor: Colors.white,
                                              textStyle: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            CircularButtons(
                                              backgroundColor:
                                              const Color(0xfffc6359),
                                              borderColor:
                                              const Color(0xfffc6359),
                                              text: 'Take Snapshot',
                                              height: 50,
                                              width: 150,
                                              onPressed: () async {
                                                screenshotController
                                                    .capture(
                                                    delay: Duration(
                                                        milliseconds:
                                                        10))
                                                    .then(
                                                        (capturedImage) async {
                                                      ShowCapturedWidget(
                                                          context,
                                                          capturedImage!);
                                                    }).catchError((onError) {
                                                  print("onError");
                                                });
                                              },
                                              textColor: Colors.white,
                                              textStyle: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10)),
                            ),
                            width: Get.width / 4,
                            child: Column(
                              children: [
                                Expanded(
                                  child: messages(_),
                                ),
                                sendmessage(_),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget messages(HelpController _) {
    return _.messagelist.length == 0
        ? SizedBox()
        : ListView.builder(
      itemCount: _.messagelist.length,
      reverse: true,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: _.firebaseAuth.currentUser!.uid ==
                  _.messagelist[index]['senderid']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: _.firebaseAuth.currentUser!.uid !=
                        _.messagelist[index]['senderid']
                        ? Colors.grey[200]
                        : Colors.lightBlue[600],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: _.firebaseAuth.currentUser!.uid !=
                          _.messagelist[index]['senderid']
                          ? Radius.circular(0)
                          : Radius.circular(12),
                      bottomRight: _.firebaseAuth.currentUser!.uid !=
                          _.messagelist[index]['senderid']
                          ? Radius.circular(0)
                          : Radius.circular(12),
                    ),
                  ),
                  width: 160,
                  padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  margin:
                  EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: _.messagelist[index]['type'].toString() != "null"
                      ? Column(
                    crossAxisAlignment:
                    _.firebaseAuth.currentUser!.uid ==
                        _.messagelist[index]['senderid']
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.start,
                    children: [
                      _.messagelist[index]['type'].toString() ==
                          "text"
                          ? Text(
                        _.messagelist[index]['message'],
                        style: TextStyle(
                            color: _.firebaseAuth.currentUser!
                                .uid ==
                                _.messagelist[index]
                                ['senderid']
                                ? Colors.white
                                : Colors.black),
                      )
                          : SizedBox()
                    ],
                  )
                      : SizedBox(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget sendmessage(HelpController _) {
    return Container(
      child: Row(
        children: [
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     showAttachmentBox(_);
          //   },
          // ),
          Expanded(
              child: CommonTextField(
                controller: _.message,
                hintText: "TyPe Here",
                isTextHidden: false,
                borderColor: Color(0xffF9F9F9),
              )
            // TextField(
            //   controller: _.message,
            //   decoration: InputDecoration(labelText: "Send a Message"),
            // ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () async {
                if (_.message.text.isEmpty) {
                  print("Please Put SOme Text");
                } else {
                  await _.sendmessage();
                }
              })
        ],
      ),
    ).marginOnly(top: 8.0).paddingAll(8.0);
  }

  renderVideo(HelpController _) {
    return Expanded(
      child: Stack(
        children: [
          RtcLocalView.SurfaceView(),
          Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.of(_.remoteUid.map(
                      (e) => GestureDetector(
                    onTap: _.switchRenders,
                    child: Container(
                      width: 120,
                      height: 120,
                      child: RtcRemoteView.SurfaceView(
                        uid: e,
                        channelId: _.channelId,
                      ),
                    ),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
