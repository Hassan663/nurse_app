// import 'package:date_format/date_format.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rrt_client_web_app/rrt_widgets/button.dart';
// import 'package:rrt_client_web_app/rrt_widgets/header.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rrt_client_web_app/rrt_widgets/textfield.dart';
// import 'package:rrt_client_web_app/utils/rrt_colors.dart';
// import 'package:rrt_client_web_app/utils/rrt_sizes.dart';
// import 'package:table_calendar/table_calendar.dart';

// DateTime? _selectedDay;

// class SetAvailability extends StatefulWidget {
//   @override
//   _SetAvailabilityState createState() => _SetAvailabilityState();
// }

// class _SetAvailabilityState extends State<SetAvailability> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     TextEditingController? availablefromController = TextEditingController();
//     TextEditingController? availabletoController = TextEditingController();

//     CalendarFormat _calendarFormat = CalendarFormat.month;
//     RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//         .toggledOff; // Can be toggled on/off by longpressing a date
//     DateTime _focusedDay = DateTime.now();
//     var a = DateTime.now();

//     DateTime? _rangeStart;
//     DateTime? _rangeEnd;
//     var formatted = formatDate(DateTime.now(), [mm]);
//     var formatted1;

//     @override
//     void initState() {
//       super.initState();

//       _selectedDay = _focusedDay;
//       //_selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//     }

//     @override
//     void dispose() {
//       //_selectedEvents.dispose();
//       super.dispose();
//     }

//     List months = [
//       'jan',
//       'feb',
//       'mar',
//       'apr',
//       'may',
//       'jun',
//       'jul',
//       'aug',
//       'sep',
//       'oct',
//       'nov',
//       'dec'
//     ];
//     void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//       if (!isSameDay(_selectedDay, selectedDay)) {
//         setState(() {
//           _selectedDay = selectedDay;
//           _focusedDay = focusedDay;
//           _rangeStart = null; // Important to clean those
//           _rangeEnd = null;
//           _rangeSelectionMode = RangeSelectionMode.toggledOff;
//           print(_selectedDay);
//           // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(_selectedDay);
//           // var month = DateTime.now();
//           formatted = formatDate(_selectedDay!, [mm]);
//           print(formatted);
//           formatted1 = formatDate(_selectedDay!, [dd]);
//           print(formatted1);
//           var current_mon = _selectedDay!.month;
//           print(months[current_mon - 1]);
//         });

//         //_selectedEvents.value = _getEventsForDay(selectedDay);
//       }
//     }

//     void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//       setState(() {
//         _selectedDay = null;
//         _focusedDay = focusedDay;
//         _rangeStart = start;
//         _rangeEnd = end;
//         _rangeSelectionMode = RangeSelectionMode.toggledOn;
//       });

//       // `start` or `end` could be null
//       //
//     }

//     return SafeArea(
//         child: SingleChildScrollView(
//       child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: new BoxDecoration(
//               color: Color(0xffE5E5E5), //new Color.fromRGBO(255, 0, 0, 0.0),
//               borderRadius: new BorderRadius.only(
//                   topLeft: Radius.circular(circular_radius_homeContainers),
//                   bottomLeft: Radius.circular(circular_radius_homeContainers))),
//           child: Padding(
//             padding: EdgeInsets.all(35.0.sp),
//             child: Column(
//               children: [
//                 Header(),
//                 SizedBox(
//                   height: 35.h,
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(right: 20.w),
//                       child: Text(
//                         'Calendar',
//                         maxLines: 1,
//                         style: TextStyle(
//                             color: Color(0xff5FA4A4),
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     Expanded(
//                         child: Divider(
//                       color: Color(0xff5FA4A4),
//                     )),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       decoration: new BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 10,
//                               offset:
//                                   Offset(0, 3), // changes position of shadow
//                             ),
//                           ],
//                           color: Colors
//                               .white, //new Color.fromRGBO(255, 0, 0, 0.0),
//                           borderRadius: new BorderRadius.all(
//                             Radius.circular(5),
//                           )),
//                       height: MediaQuery.of(context).size.height * 0.57,
//                       width: width * 0.36,
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: TableCalendar(
//                           onPageChanged: (focusedDay) {
//                             _focusedDay = focusedDay;
//                           },
//                           selectedDayPredicate: (day) =>
//                               isSameDay(_selectedDay, day),
//                           onRangeSelected: _onRangeSelected,
//                           onDaySelected: (selectedDay, focusedDay) {
//                             setState(() {
//                               _selectedDay = selectedDay;
//                               _focusedDay = focusedDay;
//                             });
//                           },
//                           calendarStyle: CalendarStyle(
//                             selectedDecoration: BoxDecoration(
//                                 color: Colors.red, shape: BoxShape.circle),
//                             rangeHighlightColor: Colors.red,
//                           ),
//                           pageJumpingEnabled: true,
//                           daysOfWeekHeight: 25.h,
//                           rowHeight: 60.h,
//                           pageAnimationEnabled: true,
//                           daysOfWeekVisible: true,
//                           headerStyle: HeaderStyle(
//                               formatButtonVisible: false,
//                               titleCentered: true,
//                               titleTextStyle: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w700),
//                               rightChevronIcon: CircleAvatar(
//                                 backgroundColor: Colors.red,
//                                 child: Icon(Icons.chevron_right),
//                               ),
//                               leftChevronIcon: CircleAvatar(
//                                 backgroundColor: Colors.red,
//                                 child: Icon(Icons.chevron_left),
//                               )),
//                           firstDay: DateTime.utc(2010, 10, 16),
//                           lastDay: DateTime.utc(2030, 3, 14),
//                           availableGestures: AvailableGestures.horizontalSwipe,
//                           headerVisible: true,
//                           focusedDay: _focusedDay,
//                         ),
//                       ),
//                     ),
//                     //second row choice chip
//                     Container(
//                       decoration: new BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 10,
//                               offset:
//                                   Offset(0, 3), // changes position of shadow
//                             ),
//                           ],
//                           color: Colors.white,
//                           borderRadius: new BorderRadius.all(
//                             Radius.circular(5),
//                           )),
//                       height: MediaQuery.of(context).size.height * 0.57,
//                       width: width * 0.36,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal:
//                                 MediaQuery.of(context).size.width * 0.03,
//                             vertical:
//                                 MediaQuery.of(context).size.height * 0.03),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Enter Your Availabilty Timings",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             Container(
//                               decoration: new BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.3),
//                                       spreadRadius: 2,
//                                       blurRadius: 10,
//                                       offset: Offset(
//                                           0, 3), // changes position of shadow
//                                     ),
//                                   ],
//                                   color: Colors.red,
//                                   borderRadius: new BorderRadius.all(
//                                     Radius.circular(5),
//                                   )),
//                               height: 250.h,
//                               width: 250.h,
//                               child: Column(
//                                 children: [
//                                   (formatted == null)
//                                       ? Text("fff")
//                                       : Text(formatted)
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 50.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Flexible(
//                                   child: Container(
//                                     width: 200.w,
//                                     child: textformfield1(
//                                       availablefromController,
//                                       "Available From",
//                                       "From",
//                                       false,
//                                       TextInputType.name,
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   "To",
//                                   style: TextStyle(
//                                       color: Colors.red,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 Flexible(
//                                   child: Container(
//                                     width: 200.w,
//                                     child: textformfield1(
//                                       availablefromController,
//                                       "Available To",
//                                       "To",
//                                       false,
//                                       TextInputType.name,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 70.h),
//                   child: CircularButtons(
//                     backgroundColor: const Color(0xfffc6359),
//                     borderColor: const Color(0xfffc6359),
//                     text: "Set Availability",
//                     height: 50,
//                     width: width * 0.3,
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(20.0))),
//                                 backgroundColor: Colors.white,
//                                 content: Container(
//                                   height: 300,
//                                   width: 500,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Text(
//                                         'Assesment',
//                                         style: TextStyle(
//                                             color: fLabelTextColor,
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       //SizedBox(height: 5.h),
//                                       Text(
//                                         "Please indicate the result of the test",
//                                         style: GoogleFonts.inter(
//                                             fontSize: 18,
//                                             fontStyle: FontStyle.normal,
//                                             fontWeight: FontWeight.w600,
//                                             color: fButtonTextColor),
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Icon(
//                                             Icons.add_circle,
//                                             color: fButtonColor,
//                                             size: 50,
//                                           ),
//                                           Icon(
//                                             Icons.remove_circle,
//                                             color: fButtonColor,
//                                             size: 50,
//                                           ),
//                                         ],
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           left: 40,
//                                           right: 40,
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             ElevatedButton(
//                                                 onPressed: () {},
//                                                 child: Text(
//                                                   "Confirm",
//                                                   style: GoogleFonts.inter(
//                                                       fontSize: 15.sp,
//                                                       fontStyle:
//                                                           FontStyle.normal,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       color: Colors.white),
//                                                 ),
//                                                 style: ElevatedButton.styleFrom(
//                                                     fixedSize: Size(140, 40),
//                                                     primary: fButtonColor,
//                                                     shape:
//                                                         RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         20)))),
//                                             ElevatedButton(
//                                                 onPressed: () {
//                                                   Navigator.of(context).pop();
//                                                 },
//                                                 child: Text(
//                                                   "Cancel",
//                                                   style: GoogleFonts.inter(
//                                                       fontSize: 15.sp,
//                                                       fontStyle:
//                                                           FontStyle.normal,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       color: Colors.white),
//                                                 ),
//                                                 style: ElevatedButton.styleFrom(
//                                                     fixedSize: Size(140, 40),
//                                                     primary: fButtonColor,
//                                                     shape:
//                                                         RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         20)))),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   // decoration: BoxDecoration(
//                                   // image: DecorationImage(
//                                   // image: NetworkImage('https://media.istockphoto.com/photos/freedom-chains-that-transform-into-birds-charge-concept-picture-id1322104312?b=1&k=20&m=1322104312&s=170667a&w=0&h=VQyPkFkMKmo0e4ixjhiOLjiRs_ZiyKR_4SAsagQQdkk='),
//                                   // fit: BoxFit.cover))
//                                 ));
//                           });
//                     },
//                     textColor: Colors.white,
//                     textStyle:
//                         TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/controllers/help/help_controller.dart';
import 'package:rtt_nurse_app/utils/rrt_sizes.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:rtt_nurse_app/widget/commontextfield.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
          color: Color(0xffE5E5E5), //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(circular_radius_homeContainers),
              bottomLeft: Radius.circular(circular_radius_homeContainers))),
      child: GetBuilder<HelpController>(
        init: HelpController(),
        builder: (_){
          return _.isLoading ?
              Center(
                child: CircularProgressIndicator(),
              )
          :
          Row(
            children: [
              Container(
                width: Get.width / 2.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width,
                      child: TextField(
                        controller: _.controller,
                        decoration: InputDecoration(hintText: 'Channel ID'),
                        onChanged: (text) {
                          _.channelId = text;
                        },
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      width: Get.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed:
                              _.isJoined ? _.leaveChannel : _.joinChannel,
                              child: Text('${_.isJoined ? 'Leave' : 'Join'} channel'),
                            ),
                          )
                        ],
                      ),
                    ),
                    renderVideo(_),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: _.switchCameras,
                            child: Text('Camera ${_.switchCamera ? 'front' : 'rear'}'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width / 2.8,
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
          );
        },
      )
    ));
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
                hintText: "Typing..........",
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
