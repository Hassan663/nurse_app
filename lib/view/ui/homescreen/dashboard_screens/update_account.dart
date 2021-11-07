import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/controllers/appointment/appointment_controller.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key? key}) : super(key: key);
  @override
  UpdateAccountState createState() => UpdateAccountState();
}

class UpdateAccountState extends State<UpdateAccount> {
  final appointmentController = Get.put(AppointmentController());
  // List<String> _subjectCollection = <String>[];
  // List<Color> _colorCollection = <Color>[];
  List<Appointment> _shiftCollection = <Appointment>[];
  List<CalendarResource> _employeeCollection = <CalendarResource>[];
  _DataSource? _events;

  @override
  void initState() {
    // _addResources();
    // _addAppointmentDetails();
    _addAppointments(8, Color(0xFF0F8644));
    _addAppointments(2, Color(0xFF0F2B86));
    _events = _DataSource(_shiftCollection, _employeeCollection);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextButton(
                child: const Text('Insert resource'),
                onPressed: () {
                  final CalendarResource resource = CalendarResource(
                    displayName: 'Sophia',
                    color: Colors.red,
                    id: '0004',
                  );
                  _employeeCollection.insert(1, resource);
                  _events!.notifyListeners(CalendarDataSourceAction.addResource,
                      <CalendarResource>[resource]);
                  Random random = Random();
                  // _addAppointments(1);
                  _events = _DataSource(_shiftCollection, _employeeCollection);
                },
              ),
              // TextButton(
              //   child: const Text('Remove resource'),
              //   onPressed: () {
              //     final CalendarResource resource = _employeeCollection[0];
              //     _employeeCollection.remove(resource);
              //     _events!.notifyListeners(
              //         CalendarDataSourceAction.removeResource,
              //         <CalendarResource>[resource]);
              //   },
              // ),
              // TextButton(
              //   child: const Text('Reset resource'),
              //   onPressed: () {
              //     _employeeCollection = <CalendarResource>[];
              //     _events!.resources!.clear();
              //     _employeeCollection.add(CalendarResource(
              //         displayName: "Sophia", id: '0004', color: Colors.green));

              //     _events!.resources!.addAll(_employeeCollection);
              //     _events!.notifyListeners(
              //         CalendarDataSourceAction.resetResource,
              //         _employeeCollection);
              //   },
              // ),

              Expanded(
                child: SfCalendar(
                  view: CalendarView.week,
                  showDatePickerButton: true,
                  dataSource: _events,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addAppointments(startHour, Color color) {
    _shiftCollection = <Appointment>[];
    final DateTime date = DateTime.now().add(Duration(days: 1 + 2));
    startHour = startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
    DateTime _shiftStartTime =
        DateTime(date.year, date.month, date.day, startHour, 0, 0);
    _shiftCollection.add(Appointment(
        startTime: _shiftStartTime,
        endTime: _shiftStartTime.add(const Duration(minutes: 30)),
        subject: "Time Slots",
        color: color,
        startTimeZone: '',
        endTimeZone: '',
        resourceIds: ["0000"]));
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }
}

// class UpdateAccount extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       decoration: new BoxDecoration(
//           color: Color(0xffE5E5E5), //new Color.fromRGBO(255, 0, 0, 0.0),
//           borderRadius: new BorderRadius.only(
//               topLeft: Radius.circular(circular_radius_homeContainers),
//               bottomLeft: Radius.circular(circular_radius_homeContainers))),
//       child: Center(
//         child: Text('update account'),
//       ),
//     ));
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:rrt_client_web_app/rrt_widgets/header.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rrt_client_web_app/utils/rrt_colors.dart';
// import 'package:rrt_client_web_app/utils/rrt_sizes.dart';

// class UpdateAccount extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       decoration: new BoxDecoration(
//           color: Color(0xffEDF1F4),
//           borderRadius: new BorderRadius.only(
//               topLeft: Radius.circular(circular_radius_homeContainers),
//               bottomLeft: Radius.circular(circular_radius_homeContainers))),
//       child: Padding(
//         padding: EdgeInsets.all(35.0.sp),
//         child: Column(
//           children: [
//             Header(),
//             SizedBox(
//               height: 35.h,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 20.w),
//                   child: Text(
//                     'All Appointment',
//                     maxLines: 1,
//                     style: TextStyle(
//                         color: Color(0xff5FA4A4), fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 Expanded(
//                     child: Divider(
//                   color: Color(0xff5FA4A4),
//                 )),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20.w),
//                   child: Text('See all',
//                       style: TextStyle(color: Color(0xff5FA4A4))),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               decoration: new BoxDecoration(
//                   color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
//                   borderRadius: new BorderRadius.all(
//                     Radius.circular(5),
//                   )),
//               // color: Colors.white,
//               height: MediaQuery.of(context).size.height * 0.73,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: EdgeInsets.all(12.0.sp),
//                 child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         //childAspectRatio: 3.w / 3.h,
//                         crossAxisSpacing: 20.w,
//                         mainAxisSpacing: 10.h),
//                     itemCount: 12,
//                     itemBuilder: (BuildContext ctx, index) {
//                       return Padding(
//                         padding: EdgeInsets.all(8.0.sp),
//                         child: SingleChildScrollView(
//                           child: Container(
//                             //height: 100.0.h,
//                             // margin: EdgeInsets.only(top: 18, right: 14, left: 14),
//                             decoration: BoxDecoration(
//                                 color: fLabelTextColor,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(15.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           CircleAvatar(
//                                             maxRadius: 30,
//                                             child: IconButton(
//                                                 onPressed: () {},
//                                                 icon: Icon(Icons.person)),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsets.only(left: 20.w),
//                                             child: Text(
//                                               "Patient $index",
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: GoogleFonts.inter(
//                                                   fontSize: 20.sp,
//                                                   fontStyle: FontStyle.normal,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.white),
//                                             ),
//                                           ),
//                                           // Image.asset("assets/video.png"),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(
//                                         left: 10.w,
//                                         right: 10.w,
//                                       ),
//                                       height: 60.h,
//                                       decoration: BoxDecoration(
//                                           color: fContainerColor,
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Container(
//                                               height: 25.h,
//                                               width: 25.w,
//                                               child: Image.asset(
//                                                   "assets/datetime.png")),
//                                           Text(
//                                             "Fri, May 23, 10:00 am - 11:00 am",
//                                             overflow: TextOverflow.ellipsis,
//                                             style: GoogleFonts.inter(
//                                                 fontSize: 15.sp,
//                                                 fontStyle: FontStyle.normal,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.white),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 // Container(
//                                 //   margin: EdgeInsets.only(
//                                 //       left: 10.w, right: 10.w, top: 20.h),
//                                 //   height: 60.h,
//                                 //   decoration: BoxDecoration(
//                                 //       color: fContainerColor,
//                                 //       borderRadius: BorderRadius.circular(10)),
//                                 //   child: Row(
//                                 //     mainAxisAlignment:
//                                 //         MainAxisAlignment.spaceEvenly,
//                                 //     children: [
//                                 //       Container(
//                                 //           height: 25.h,
//                                 //           width: 25.w,
//                                 //           child: Image.asset(
//                                 //               "assets/datetime.png")),
//                                 //       Text(
//                                 //         "Fri, May 23, 10:00 am - 11:00 am",
//                                 //         overflow: TextOverflow.ellipsis,
//                                 //         style: GoogleFonts.inter(
//                                 //             fontSize: 15.sp,
//                                 //             fontStyle: FontStyle.normal,
//                                 //             fontWeight: FontWeight.w500,
//                                 //             color: Colors.white),
//                                 //       )
//                                 //     ],
//                                 //   ),
//                                 // ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 10.w, right: 10.w, top: 30.h),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       ElevatedButton(
//                                           onPressed: () {
//                                             showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return AlertDialog(
//                                                       shape: RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                                   Radius.circular(
//                                                                       20.0))),
//                                                       backgroundColor:
//                                                           Colors.white,
//                                                       content: Container(
//                                                         height: 300,
//                                                         width: 500,
//                                                         child: Column(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceAround,
//                                                           children: [
//                                                             Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               children: [
//                                                                 Text(
//                                                                   'Countdown Started',
//                                                                   style: TextStyle(
//                                                                       color:
//                                                                           fButtonColor,
//                                                                       fontSize:
//                                                                           25,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .spaceAround,
//                                                               children: [
//                                                                 Container(
//                                                                   height: 170.0,
//                                                                   width: 270,
//                                                                   // margin: EdgeInsets.only(top: 18, right: 14, left: 14),
//                                                                   decoration: BoxDecoration(
//                                                                       color:
//                                                                           fLabelTextColor,
//                                                                       borderRadius:
//                                                                           BorderRadius.circular(
//                                                                               15)),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       Padding(
//                                                                         padding:
//                                                                             const EdgeInsets.all(15.0),
//                                                                         child:
//                                                                             Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Text(
//                                                                               "Appointment $index",
//                                                                               style: GoogleFonts.inter(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, color: Colors.white),
//                                                                             ),
//                                                                             // Image.asset("assets/video.png"),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                       Container(
//                                                                         margin: EdgeInsets.only(
//                                                                             left:
//                                                                                 10,
//                                                                             right:
//                                                                                 10),
//                                                                         height:
//                                                                             60,
//                                                                         decoration: BoxDecoration(
//                                                                             color:
//                                                                                 fContainerColor,
//                                                                             borderRadius:
//                                                                                 BorderRadius.circular(10)),
//                                                                         child:
//                                                                             Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(10.0),
//                                                                           child:
//                                                                               Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceBetween,
//                                                                             children: [
//                                                                               Image.asset("assets/datetime.png"),
//                                                                               Text(
//                                                                                 "Fri, May 23, 10:00 am - 11:00 am",
//                                                                                 style: GoogleFonts.inter(fontSize: 12, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, color: Colors.white),
//                                                                               )
//                                                                             ],
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                       Padding(
//                                                                         padding: const EdgeInsets.only(
//                                                                             left:
//                                                                                 10,
//                                                                             right:
//                                                                                 10,
//                                                                             top:
//                                                                                 10),
//                                                                         child:
//                                                                             Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             ElevatedButton(
//                                                                                 onPressed: () {},
//                                                                                 child: Text(
//                                                                                   "Start Soon",
//                                                                                   style: GoogleFonts.inter(fontSize: 15.sp, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, color: Colors.white),
//                                                                                 ),
//                                                                                 style: ElevatedButton.styleFrom(fixedSize: Size(110, 30), primary: Colors.orangeAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
//                                                                             ElevatedButton(
//                                                                                 onPressed: () {
//                                                                                   Navigator.of(context).pop();
//                                                                                 },
//                                                                                 child: Text(
//                                                                                   "Cancel",
//                                                                                   style: GoogleFonts.inter(fontSize: 15.sp, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, color: Colors.white),
//                                                                                 ),
//                                                                                 style: ElevatedButton.styleFrom(fixedSize: Size(110, 30), primary: fButtonColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
//                                                                           ],
//                                                                         ),
//                                                                       )
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 Column(
//                                                                   children: [
//                                                                     Icon(
//                                                                         Icons
//                                                                             .timer,
//                                                                         size:
//                                                                             60,
//                                                                         color:
//                                                                             fTextTwoColor),
//                                                                     TimerCountdown(
//                                                                       hoursDescription:
//                                                                           "HH",
//                                                                       minutesDescription:
//                                                                           "MM",
//                                                                       secondsDescription:
//                                                                           "SS",
//                                                                       descriptionTextStyle: TextStyle(
//                                                                           fontSize:
//                                                                               15,
//                                                                           color:
//                                                                               fTextTwoColor,
//                                                                           fontWeight:
//                                                                               FontWeight.w600),
//                                                                       enableDescriptions:
//                                                                           true,
//                                                                       timeTextStyle: TextStyle(
//                                                                           fontSize:
//                                                                               35,
//                                                                           color:
//                                                                               fTextTwoColor,
//                                                                           fontWeight:
//                                                                               FontWeight.w900),
//                                                                       colonsTextStyle: TextStyle(
//                                                                           fontWeight: FontWeight
//                                                                               .bold,
//                                                                           color:
//                                                                               fTextTwoColor,
//                                                                           fontSize:
//                                                                               15),
//                                                                       spacerWidth:
//                                                                           0,
//                                                                       format: CountDownTimerFormat
//                                                                           .hoursMinutesSeconds,
//                                                                       endTime:
//                                                                           DateTime.now()
//                                                                               .add(
//                                                                         Duration(
//                                                                           minutes:
//                                                                               27,
//                                                                           seconds:
//                                                                               34,
//                                                                         ),
//                                                                       ),
//                                                                       onEnd:
//                                                                           () {
//                                                                         print(
//                                                                             "Timer finished");
//                                                                       },
//                                                                     ),
//                                                                   ],
//                                                                 )
//                                                               ],
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ));
//                                                 });
//                                           },
//                                           child: Text(
//                                             "Accept",
//                                             overflow: TextOverflow.ellipsis,
//                                             style: GoogleFonts.inter(
//                                                 fontSize: 15.sp,
//                                                 fontStyle: FontStyle.normal,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.white),
//                                           ),
//                                           style: ElevatedButton.styleFrom(
//                                               fixedSize: Size(130.w, 30.h),
//                                               primary: fButtonColor,
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           20)))),
//                                       ElevatedButton(
//                                           onPressed: () {},
//                                           child: Text(
//                                             "Cancel",
//                                             overflow: TextOverflow.ellipsis,
//                                             style: GoogleFonts.inter(
//                                                 fontSize: 15.sp,
//                                                 fontStyle: FontStyle.normal,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.white),
//                                           ),
//                                           style: ElevatedButton.styleFrom(
//                                               fixedSize: Size(130.w, 30.h),
//                                               primary: fButtonColor,
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           20)))),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 30.h,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
