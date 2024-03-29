// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rtt_nurse_app/controllers/appointment/appointment_controller.dart';
// import 'package:rtt_nurse_app/utils/rrt_colors.dart';
// import 'package:rtt_nurse_app/utils/rrt_sizes.dart';
// import 'package:rtt_nurse_app/view/rrt_widgets/header.dart';

// class HomeDashboard extends StatefulWidget {
//   @override
//   State<HomeDashboard> createState() => _HomeDashboardState();
// }

// class _HomeDashboardState extends State<HomeDashboard>
//     with AutomaticKeepAliveClientMixin {
//   final appointmentController = Get.find<AppointmentController>();

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
//                 child: Obx(() => GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         //childAspectRatio: 3.w / 3.h,
//                         crossAxisSpacing: 20.w,
//                         mainAxisSpacing: 10.h),
//                     itemCount:
//                         appointmentController.availableAppointments.length,
//                     itemBuilder: (BuildContext ctx, index) {
//                       DateTime date = DateTime.fromMillisecondsSinceEpoch(
//                           appointmentController.availableAppointments[index]
//                                   .reqCreatedAt!.seconds *
//                               1000);
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
//                                       padding: EdgeInsets.only(
//                                           left: 20, top: 20, bottom: 20),
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
//                                                 EdgeInsets.only(left: 15.w),
//                                             child: Container(
//                                               width: 140,
//                                               child: Text(
//                                                 "Patient: ${appointmentController.availableAppointments[index].firstName} ${appointmentController.availableAppointments[index].lastName}",
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 maxLines: 1,
//                                                 style: GoogleFonts.inter(
//                                                     fontSize: 17.sp,
//                                                     fontStyle: FontStyle.normal,
//                                                     fontWeight: FontWeight.w600,
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
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
//                                           Container(
//                                             width: 150,
//                                             child: Text(
//                                               "${date.day}-${date.month}-${date.year}",
//                                               overflow: TextOverflow.ellipsis,
//                                               style: GoogleFonts.inter(
//                                                   fontSize: 15.sp,
//                                                   fontStyle: FontStyle.normal,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Colors.white),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
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
//                     })),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/controllers/homeDashboard/homedashboard_controller.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/header.dart';


class HommeDashBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDashboardController>(
      init: HomeDashboardController(),
      builder: (_){
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Header(),
                  Padding(
                    padding: EdgeInsets.only(top: 130),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 200.0,
                          width: Get.width * 0.23,
                          // margin: EdgeInsets.only(top: 18, right: 14, left: 14),
                          decoration: BoxDecoration(
                              color: fLabelTextColor,
                              borderRadius: BorderRadius.circular(15)),

                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Schedule",
                                        style: WhiteTitle1Text,
                                      ),
                                      Icon(
                                        Icons.event,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                ),
                                CircularButtons(
                                  backgroundColor: const Color(0xfffc6359),
                                  borderColor: const Color(0xfffc6359),
                                  text: "Set Availability",
                                  height: 40,
                                  width: Get.width * 0.2,
                                  onPressed: () {
                                    // Get.to(ScheduleAppointment());
                                  },
                                  textColor: Colors.white,
                                  textStyle: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 200.0,
                          width: Get.width * 0.23,
                          // margin: EdgeInsets.only(top: 18, right: 14, left: 14),
                          decoration: BoxDecoration(
                              color: fLabelTextColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Appointments",
                                        style: WhiteTitle1Text,
                                      ),
                                      Icon(
                                        Icons.event_note,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                ),
                                CircularButtons(
                                  backgroundColor: const Color(0xfffc6359),
                                  borderColor: const Color(0xfffc6359),
                                  text: "All Appointment",
                                  height: 40,
                                  width: Get.width * 0.2,
                                  onPressed: () {
                                    // Get.to(HomeDashboard());
                                  },
                                  textColor: Colors.white,
                                  textStyle: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//
// class HommeDashBoard extends StatefulWidget {
//   const HommeDashBoard({Key? key}) : super(key: key);
//
//   @override
//   _HommeDashBoardState createState() => _HommeDashBoardState();
// }
//
// class _HommeDashBoardState extends State<HommeDashBoard> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return
//   }
// }
