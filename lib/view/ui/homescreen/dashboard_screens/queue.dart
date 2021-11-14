import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtt_nurse_app/constants/rrt_sizes.dart';
import 'package:rtt_nurse_app/controllers/appointment/appointment_controller.dart';
import 'package:rtt_nurse_app/controllers/queue/queue_controller.dart';
import 'package:rtt_nurse_app/utils/rrt_colors.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rtt_nurse_app/controllers/help/help_controller.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:rtt_nurse_app/widget/commontextfield.dart';


class Queue extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QueueController>(
      init: QueueController(),
      builder: (_) {
        return SafeArea(
            child: Container(
                child: getQueue(_),
            ));
      },
    );
  }

  Widget getQueue(QueueController _){
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: new BoxDecoration(
          color: Color(0xffEDF1F4),),
      child: Padding(
        padding: EdgeInsets.all(35.0.sp),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Text(
                    'Queue',
                    maxLines: 1,
                    style: TextStyle(
                        color: Color(0xff5FA4A4), fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                    child: Divider(
                      color: Color(0xff5FA4A4),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text('See all',
                      style: TextStyle(color: Color(0xff5FA4A4))),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * 0.70,
                  width: Get.width * 0.7,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          bottomRight:
                          Radius.circular(circular_radius_homeContainers),
                          topRight:
                          Radius.circular(circular_radius_homeContainers),
                          topLeft:
                          Radius.circular(circular_radius_homeContainers),
                          bottomLeft:
                          Radius.circular(circular_radius_homeContainers))),
                  child: ListView.builder(
                      itemCount:
                      _.appoinmentlist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext ctx, index) {
                        // DateTime date =
                        //     DateTime.fromMillisecondsSinceEpoch(
                        //         appointmentController
                        //                 .availableAppointments[index]
                        //                 .reqCreatedAt!
                        //                 .seconds *
                        //             1000);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Container(
                                  height: 100.h,
                                  width: Get.width * 0.2,
                                  decoration: BoxDecoration(
                                      color: fLabelTextColor,
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Container(
                                          width: Get.width/2,
                                          child: Text(
                                            "${_.appoinmentlist[index]['starttime']}",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 1,
                                            style: GoogleFonts.inter(
                                                fontSize: 17.sp,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(left: 15.w),
                                      //   child: Container(
                                      //     width: 140,
                                      //     child: Text(
                                      //       " (1) -  (1)",
                                      //       softWrap: true,
                                      //       maxLines: 1,
                                      //       style: GoogleFonts.inter(
                                      //           fontSize: 17.sp,
                                      //           fontStyle: FontStyle.normal,
                                      //           fontWeight: FontWeight.w600,
                                      //           color: Colors.white),
                                      //     ),
                                      //   ),
                                      // ),
                                      CircularButtons(
                                          backgroundColor:
                                          const Color(0xfffc6359),
                                          borderColor:
                                          const Color(0xfffc6359),
                                          text: "Start",
                                          height: 40,
                                          width: Get.width * 0.1,
                                          onPressed: () {
                                            _.isSelected = false;
                                            _.update();
                                          },
                                          textColor: Colors.white,
                                          textStyle: WhiteText),
                                      SizedBox(height: 30.h),
                                    ],
                                  )),
                            ),
                          ],
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  // Container buildContainerHelp(BuildContext context) {
  //   return Container(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       decoration: new BoxDecoration(
  //           color: Color(0xffE5E5E5), //new Color.fromRGBO(255, 0, 0, 0.0),
  //           borderRadius: new BorderRadius.only(
  //               topLeft: Radius.circular(circular_radius_homeContainers),
  //               bottomLeft: Radius.circular(circular_radius_homeContainers))),
  //       child: GetBuilder<HelpController>(
  //         init: HelpController(),
  //         builder: (_) {
  //           return _.isLoading
  //               ? Center(
  //             child: CircularProgressIndicator(),
  //           )
  //               : Row(
  //             children: [
  //               Container(
  //                 width: Get.width / 2.8,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Container(
  //                       width: Get.width,
  //                       child: TextField(
  //                         controller: _.controller,
  //                         decoration:
  //                         InputDecoration(hintText: 'Channel ID'),
  //                         onChanged: (text) {
  //                           _.channelId = text;
  //                         },
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 30.0,
  //                     ),
  //                     Container(
  //                       width: Get.width,
  //                       child: Row(
  //                         children: [
  //                           Expanded(
  //                             flex: 1,
  //                             child: ElevatedButton(
  //                               onPressed: _.isJoined
  //                                   ? _.leaveChannel
  //                                   : _.joinChannel,
  //                               child: Text(
  //                                   '${_.isJoined ? 'Leave' : 'Join'} channel'),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     renderVideo(_),
  //                     SizedBox(
  //                       height: 30.0,
  //                     ),
  //                     Align(
  //                       alignment: Alignment.bottomRight,
  //                       child: Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           ElevatedButton(
  //                             onPressed: _.switchCameras,
  //                             child: Text(
  //                                 'Camera ${_.switchCamera ? 'front' : 'rear'}'),
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 width: Get.width / 2.8,
  //                 child: Column(
  //                   children: [
  //                     Expanded(
  //                       child: messages(_),
  //                     ),
  //                     sendmessage(_),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           );
  //         },
  //       ));
  // }
  //
  // Widget messages(HelpController _) {
  //   return _.messagelist.length == 0
  //       ? SizedBox()
  //       : ListView.builder(
  //     itemCount: _.messagelist.length,
  //     reverse: true,
  //     itemBuilder: (ctx, index) {
  //       return Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: _.firebaseAuth.currentUser!.uid ==
  //                 _.messagelist[index]['senderid']
  //                 ? MainAxisAlignment.end
  //                 : MainAxisAlignment.start,
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                   color: _.firebaseAuth.currentUser!.uid !=
  //                       _.messagelist[index]['senderid']
  //                       ? Colors.grey[200]
  //                       : Colors.lightBlue[600],
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(12),
  //                     topRight: Radius.circular(12),
  //                     bottomLeft: _.firebaseAuth.currentUser!.uid !=
  //                         _.messagelist[index]['senderid']
  //                         ? Radius.circular(0)
  //                         : Radius.circular(12),
  //                     bottomRight: _.firebaseAuth.currentUser!.uid !=
  //                         _.messagelist[index]['senderid']
  //                         ? Radius.circular(0)
  //                         : Radius.circular(12),
  //                   ),
  //                 ),
  //                 width: 160,
  //                 padding:
  //                 EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  //                 margin:
  //                 EdgeInsets.symmetric(vertical: 4, horizontal: 8),
  //                 child: _.messagelist[index]['type'].toString() != "null"
  //                     ? Column(
  //                   crossAxisAlignment:
  //                   _.firebaseAuth.currentUser!.uid ==
  //                       _.messagelist[index]['senderid']
  //                       ? CrossAxisAlignment.start
  //                       : CrossAxisAlignment.start,
  //                   children: [
  //                     _.messagelist[index]['type'].toString() ==
  //                         "text"
  //                         ? Text(
  //                       _.messagelist[index]['message'],
  //                       style: TextStyle(
  //                           color: _.firebaseAuth.currentUser!
  //                               .uid ==
  //                               _.messagelist[index]
  //                               ['senderid']
  //                               ? Colors.white
  //                               : Colors.black),
  //                     )
  //                         : SizedBox()
  //                   ],
  //                 )
  //                     : SizedBox(),
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  //
  // Widget sendmessage(HelpController _) {
  //   return Container(
  //     child: Row(
  //       children: [
  //         // IconButton(
  //         //   icon: Icon(Icons.add),
  //         //   onPressed: () {
  //         //     showAttachmentBox(_);
  //         //   },
  //         // ),
  //         Expanded(
  //             child: CommonTextField(
  //               controller: _.message,
  //               hintText: "Typing..........",
  //               isTextHidden: false,
  //               borderColor: Color(0xffF9F9F9),
  //             )
  //           // TextField(
  //           //   controller: _.message,
  //           //   decoration: InputDecoration(labelText: "Send a Message"),
  //           // ),
  //         ),
  //         IconButton(
  //             icon: Icon(Icons.send),
  //             onPressed: () async {
  //               if (_.message.text.isEmpty) {
  //                 print("Please Put SOme Text");
  //               } else {
  //                 await _.sendmessage();
  //               }
  //             })
  //       ],
  //     ),
  //   ).marginOnly(top: 8.0).paddingAll(8.0);
  // }
  //
  // renderVideo(HelpController _) {
  //   return Expanded(
  //     child: Stack(
  //       children: [
  //         RtcLocalView.SurfaceView(),
  //         Align(
  //           alignment: Alignment.topLeft,
  //           child: SingleChildScrollView(
  //             scrollDirection: Axis.horizontal,
  //             child: Row(
  //               children: List.of(_.remoteUid.map(
  //                     (e) => GestureDetector(
  //                   onTap: _.switchRenders,
  //                   child: Container(
  //                     width: 120,
  //                     height: 120,
  //                     child: RtcRemoteView.SurfaceView(
  //                       uid: e,
  //                       channelId: _.channelId,
  //                     ),
  //                   ),
  //                 ),
  //               )),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }


}


// class Queue extends StatefulWidget {
//   const Queue({Key? key}) : super(key: key);
//
//   @override
//   _QueueState createState() => _QueueState();
// }
//
// class _QueueState extends State<Queue> with AutomaticKeepAliveClientMixin {
//   bool isSelected = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
//
//
//
//   // Container buildContainerappoitment(BuildContext context, double height,
//   //     double width, AppointmentController appointmentController) {
//   //   return
//   // }
//
//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }
