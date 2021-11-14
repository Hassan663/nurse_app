import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/controllers/appointment/appointment_controller.dart';

import 'package:rtt_nurse_app/utils/rrt_colors.dart';
import 'package:rtt_nurse_app/utils/rrt_sizes.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/header.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_range/time_range.dart';

class SetAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(
        init: AppointmentController(),
        builder: (_) {
          return _.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                  child: Container(
                      height: Get.height,
                      width: Get.width,
                      decoration: new BoxDecoration(
                          color: Color(0xffE5E5E5),
                          borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(
                                  circular_radius_homeContainers),
                              bottomLeft: Radius.circular(
                                  circular_radius_homeContainers))),
                      child: Padding(
                        padding: EdgeInsets.all(35.0.sp),
                        child: ListView(
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
                                    'Calendar',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Color(0xff5FA4A4),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  color: Color(0xff5FA4A4),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: new BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.white,
                                          //new Color.fromRGBO(255, 0, 0, 0.0),
                                          borderRadius: new BorderRadius.all(
                                            Radius.circular(5),
                                          )),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      width: Get.width * 0.30,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          child: TableCalendar(
                                            firstDay: DateTime.now(),
                                            lastDay: DateTime.utc(2030, 3, 14),
                                            focusedDay: _.focusedDays,
                                            calendarFormat: _.calendarFormat,
                                            calendarStyle: CalendarStyle(
                                              selectedDecoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle),
                                              rangeHighlightColor: Colors.red,
                                            ),
                                            pageJumpingEnabled: true,
                                            daysOfWeekHeight: 25.h,
                                            rowHeight: 60.h,
                                            pageAnimationEnabled: true,
                                            daysOfWeekVisible: true,
                                            headerStyle: HeaderStyle(
                                              formatButtonVisible: false,
                                              titleCentered: true,
                                              titleTextStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                              rightChevronIcon: CircleAvatar(
                                                backgroundColor: Colors.red,
                                                child:
                                                    Icon(Icons.chevron_right),
                                              ),
                                              leftChevronIcon: CircleAvatar(
                                                backgroundColor: Colors.red,
                                                child: Icon(Icons.chevron_left),
                                              ),
                                            ),
                                            availableGestures: AvailableGestures
                                                .horizontalSwipe,
                                            headerVisible: true,
                                            selectedDayPredicate: (day) {
                                              return isSameDay(
                                                  _.selectedDays, day);
                                            },
                                            onDaySelected:
                                                (selectedDay, focusedDay) {
                                              if (!isSameDay(_.selectedDays,
                                                  selectedDay)) {
                                                _.selectedDays = selectedDay;
                                                _.focusedDays = focusedDay;
                                                _.update();
                                                print(_.selectedDays);
                                              }
                                            },
                                            onFormatChanged: (format) {
                                              if (_.calendarFormat != format) {
                                                _.calendarFormat = format;
                                                _.update();
                                              }
                                            },
                                            onPageChanged: (focusedDay) {
                                              _.focusedDays = focusedDay;
                                              _.update();
                                            },
                                          ),
                                          // TableCalendar(
                                          //   onPageChanged: (focusedDay) {
                                          //     _.focusedDays = focusedDay;
                                          //   },
                                          //   selectedDayPredicate: (day) =>
                                          //       isSameDay(_.selectedDays, day),
                                          //   onRangeSelected: _.onRangeSelected,
                                          //   onDaySelected: _.onDaySelected,
                                          //   calendarStyle: CalendarStyle(
                                          //     selectedDecoration: BoxDecoration(
                                          //         color: Colors.red,
                                          //         shape: BoxShape.circle),
                                          //     rangeHighlightColor: Colors.red,
                                          //   ),
                                          //   pageJumpingEnabled: true,
                                          //   daysOfWeekHeight: 25.h,
                                          //   rowHeight: 60.h,
                                          //   pageAnimationEnabled: true,
                                          //   daysOfWeekVisible: true,
                                          //   headerStyle: HeaderStyle(
                                          //       formatButtonVisible: false,
                                          //       titleCentered: true,
                                          //       titleTextStyle: TextStyle(
                                          //           color: Colors.black,
                                          //           fontWeight: FontWeight.w700),
                                          //       rightChevronIcon: CircleAvatar(
                                          //         backgroundColor: Colors.red,
                                          //         child: Icon(Icons.chevron_right),
                                          //       ),
                                          //       leftChevronIcon: CircleAvatar(
                                          //         backgroundColor: Colors.red,
                                          //         child: Icon(Icons.chevron_left),
                                          //       )),
                                          //   firstDay: DateTime.utc(2010, 10, 16),
                                          //   lastDay: DateTime.utc(2030, 3, 14),
                                          //   availableGestures:
                                          //   AvailableGestures.horizontalSwipe,
                                          //   headerVisible: true,
                                          //   focusedDay: _.focusedDays,
                                          // ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                      decoration: new BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                            Radius.circular(5),
                                          )),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      width: Get.width * 0.3,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.03,
                                            vertical: Get.height * 0.03),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Enter Your Availabilty Timings",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              TimeRange(
                                                fromTitle: Text(
                                                  'FROM',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF333A47),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                toTitle: Text(
                                                  'TO',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF333A47),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                titlePadding: 50,
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF333A47),
                                                ),
                                                activeTextStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFE9A75),
                                                ),
                                                borderColor: Color(0xFF333A47),
                                                activeBorderColor:
                                                    Color(0xFF333A47),
                                                backgroundColor:
                                                    Colors.transparent,
                                                activeBackgroundColor:
                                                    Color(0xFF333A47),
                                                firstTime: TimeOfDay(
                                                    hour: 9, minute: 00),
                                                lastTime: TimeOfDay(
                                                    hour: 17, minute: 00),
                                                initialRange: _.timeRange,
                                                timeStep: 30,
                                                timeBlock: 30,
                                                onRangeCompleted: (range) {
                                                  _.timeRange = range;
                                                  _.update();
                                                  print(
                                                      "Start Data ${_.timeRange!.start.format(context)} End Date ${_.timeRange!.end.format(context)}");
                                                },
                                              ),
                                              // GestureDetector(
                                              //   onTap: () {
                                              //     showTimeRangePicker(
                                              //       autoAdjustLabels: true,
                                              //       rotateLabels: true,
                                              //       ticksLength: 100,
                                              //       //ticksWidth: 300,
                                              //       context: context,
                                              //       start: TimeOfDay(
                                              //           hour: 22, minute: 9),
                                              //       onStartChange: (start) {
                                              //         print("start time " +
                                              //             start.toString());
                                              //         _.availablefromController.text =
                                              //             "${start.hourOfPeriod}:${start.minute == 0 ? "00" : start.minute} ${start.period.index == 0 ? "AM" : "PM"}";
                                              //         _.startingTimeRange = start;
                                              //       },
                                              //       onEndChange: (end) {
                                              //         print("end time " +
                                              //             end.toString());
                                              //         _.availabletoController.text =
                                              //             "${end.hourOfPeriod}:${end.minute == 0 ? "00" : end.minute} ${end.period.index == 0 ? "AM" : "PM"}";
                                              //         _.endingTimeRange = end;
                                              //       },
                                              //       interval: Duration(minutes: 5),
                                              //       use24HourFormat: false,
                                              //
                                              //       strokeColor: Colors.red,
                                              //       handlerColor: Colors.orange[700],
                                              //       selectedColor: Colors.amber,
                                              //       backgroundColor:
                                              //           Colors.black.withOpacity(0.3),
                                              //       ticks: 12,
                                              //       ticksColor: Colors.white,
                                              //       snap: true,
                                              //       labels: [
                                              //         "12 pm",
                                              //         "3 am",
                                              //         "6 am",
                                              //         "9 am",
                                              //         "12 am",
                                              //         "3 pm",
                                              //         "6 pm",
                                              //         "9 pm"
                                              //       ].asMap().entries.map((e) {
                                              //         return ClockLabel.fromIndex(
                                              //             idx: e.key,
                                              //             length: 8,
                                              //             text: e.value);
                                              //       }).toList(),
                                              //       //labelOffset: -30,
                                              //       labelStyle: TextStyle(
                                              //           fontSize: 22,
                                              //           color: Colors.grey,
                                              //           fontWeight: FontWeight.bold),
                                              //       timeTextStyle: TextStyle(
                                              //           color: Colors.red[700],
                                              //           fontSize: 24,
                                              //           fontStyle: FontStyle.italic,
                                              //           fontWeight: FontWeight.bold),
                                              //       activeTimeTextStyle: TextStyle(
                                              //           color: Colors.orange,
                                              //           fontSize: 26,
                                              //           fontStyle: FontStyle.italic,
                                              //           fontWeight: FontWeight.bold),
                                              //     );
                                              //   },
                                              //   child: Container(
                                              //     decoration: new BoxDecoration(
                                              //         boxShadow: [
                                              //           BoxShadow(
                                              //             //  startSlotspreadRadius: 2,
                                              //             blurRadius: 10,
                                              //             offset: Offset(0,
                                              //                 3), // changes position of shadow
                                              //           ),
                                              //         ],
                                              //         color: Colors.red,
                                              //         borderRadius:
                                              //             new BorderRadius.all(
                                              //           Radius.circular(5),
                                              //         )),
                                              //     height: 150.h,
                                              //     width: 150.h,
                                              //     child: Column(
                                              //       children: [
                                              //         SizedBox(
                                              //           height: 10.h,
                                              //         ),
                                              //         Padding(
                                              //           padding: EdgeInsets.all(8.0),
                                              //           child: Text(
                                              //             _.month.toUpperCase(),
                                              //             style: WhiteText,
                                              //           ),
                                              //         ),
                                              //         SizedBox(
                                              //           height: 10.h,
                                              //         ),
                                              //         Padding(
                                              //           padding: EdgeInsets.all(8.0),
                                              //           child: Text(_.day,
                                              //               style: WhiteText),
                                              //         )
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),

                                              SizedBox(
                                                height: 50.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10.h, top: 10.h),
                                                child: CircularButtons(
                                                  textColor: Colors.white,
                                                  textStyle: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  backgroundColor:
                                                      const Color(0xfffc6359),
                                                  borderColor:
                                                      const Color(0xfffc6359),
                                                  text: "Save",
                                                  height: 40,
                                                  width: Get.width * 0.1,
                                                  onPressed: () {
                                                    // Slots s = Slots(
                                                    //     startSlot: _
                                                    //         .availablefromController
                                                    //         .text
                                                    //         .toString(),
                                                    //     endSlot: _
                                                    //         .availabletoController
                                                    //         .text
                                                    //         .toString());
                                                    // _.authController.selectedSlot
                                                    //     .add(s);
                                                    // print(_.authController
                                                    //     .selectedSlot.length);
                                                    // _.availablefromController.clear();
                                                    // _.availabletoController.clear();
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              content:
                                                                  Container(
                                                                height: 200,
                                                                width: 400,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Confirm this time availability',
                                                                          style: TextStyle(
                                                                              color: fButtonColor,
                                                                              fontSize: 25,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        CircularButtons(
                                                                            backgroundColor: const Color(
                                                                                0xff4F8484),
                                                                            borderColor: const Color(
                                                                                0xff4F8484),
                                                                            text:
                                                                                "Yes",
                                                                            height:
                                                                                50,
                                                                            width: Get.width *
                                                                                0.1,
                                                                            textColor: Colors
                                                                                .white,
                                                                            textStyle:
                                                                                WhiteText,
                                                                            onPressed:
                                                                                () {
                                                                              _.addAppointment(context);
                                                                              // print(
                                                                              //     "length : ${_.authController.selectedSlot.length}");
                                                                              //
                                                                              // Database()
                                                                              //     .createAppoitmentInDatabase(
                                                                              //   Schedule(
                                                                              //     date: _.selectedDays == null
                                                                              //         ? DateTime.now()
                                                                              //         : _.selectedDays,
                                                                              //     slots:
                                                                              //         _.authController.selectedSlot,
                                                                              //   ),
                                                                              // );
                                                                              // _.authController
                                                                              //     .selectedSlot = <
                                                                              //         Slots>[]
                                                                              //     .obs;
                                                                              // Get.back();
                                                                            }),
                                                                        CircularButtons(
                                                                          backgroundColor:
                                                                              const Color(0xfffc6359),
                                                                          borderColor:
                                                                              const Color(0xfffc6359),
                                                                          text:
                                                                              "No",
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              Get.width * 0.1,
                                                                          textColor:
                                                                              Colors.white,
                                                                          textStyle:
                                                                              WhiteText,
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ));
                                                        });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                //second row choice chip
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.87,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: new BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius: new BorderRadius.all(
                                          Radius.circular(5),
                                        )),
                                    child: SfCalendar(
                                      dataSource: MeetingDataSource(_.setAppoinment()),
                                      // dataSource: MeetingDataSource(_.getDataSource()),
                                      view: CalendarView.week,
                                      // showCurrentTimeIndicator: true,
                                      showWeekNumber: false,
                                      initialDisplayDate: DateTime.now(),
                                      todayHighlightColor: Colors.red,

                                      // showDatePickerButton: true,
                                      // showNavigationArrow: true,

                                      // // onTap: (CalendarTapDetails details) {

                                      // // },
                                      // blackoutDates: <DateTime>[
                                      //   DateTime(2021, 11, 10),
                                      //   DateTime(2021, 11, 15),
                                      //   DateTime(2021, 11, 20),
                                      //   DateTime(2021, 11, 22),
                                      //   DateTime(2021, 11, 24)
                                      // ],
                                      // blackoutDatesTextStyle: TextStyle(
                                      //     fontWeight: FontWeight.w400,
                                      //     fontSize: 13,
                                      //     color: Colors.red,
                                      //     decoration: TextDecoration.lineThrough),
                                      // todayHighlightColor: Colors.red,
                                      // initialDisplayDate: _focusedDay,
                                      // cellBorderColor: Colors.grey,
                                      // dataSource: _events,
                                      // //   dataSource: MeetingDataSource(_getDataSource()),
                                      // allowDragAndDrop: false,
                                      // view: CalendarView.month,
                                      // firstDayOfWeek: 4,
                                      // selectionDecoration: BoxDecoration(
                                      //   color: Colors.transparent,
                                      //   border: Border.all(color: Colors.red, width: 2),
                                      //   borderRadius:
                                      //       const BorderRadius.all(Radius.circular(4)),
                                      //   shape: BoxShape.rectangle,
                                      // ),
                                      // cellEndPadding: 5,
                                      // monthViewSettings:
                                      //     MonthViewSettings(appointmentDisplayCount: 2),
                                      // monthViewSettings: MonthViewSettings(
                                      //     appointmentDisplayMode:
                                      //         MonthAppointmentDisplayMode.appointment),

                                      // monthViewSettings: MonthViewSettings(
                                      //     appointmentDisplayMode:
                                      //         MonthAppointmentDisplayMode.appointment),
                                    )),
                              ],
                            ),
                            Spacer(),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(vertical: 50.h, horizontal: 400.w),
                            //   child: CircularButtons(
                            //     backgroundColor: const Color(0xfffc6359),
                            //     borderColor: const Color(0xfffc6359),
                            //     text: "Set Availability",
                            //     height: 50,
                            //     width: width * 0.3,
                            //     onPressed: () {
                            //       showDialog(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return AlertDialog(
                            //                 shape: RoundedRectangleBorder(
                            //                     borderRadius: BorderRadius.all(
                            //                         Radius.circular(20.0))),
                            //                 backgroundColor: Colors.white,
                            //                 content: Container(
                            //                   height: 200,
                            //                   width: 400,
                            //                   child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.spaceAround,
                            //                     children: [
                            //                       Row(
                            //                         mainAxisAlignment:
                            //                             MainAxisAlignment.center,
                            //                         children: [
                            //                           Text(
                            //                             'Confirm this time availability',
                            //                             style: TextStyle(
                            //                                 color: fButtonColor,
                            //                                 fontSize: 25,
                            //                                 fontWeight: FontWeight.bold),
                            //                           ),
                            //                         ],
                            //                       ),
                            //                       Row(
                            //                         mainAxisAlignment:
                            //                             MainAxisAlignment.spaceEvenly,
                            //                         children: [
                            //                           CircularButtons(
                            //                               backgroundColor:
                            //                                   const Color(0xff4F8484),
                            //                               borderColor:
                            //                                   const Color(0xff4F8484),
                            //                               text: "Yes",
                            //                               height: 50,
                            //                               width: width * 0.1,
                            //                               textColor: Colors.white,
                            //                               textStyle: WhiteText,
                            //                               onPressed: () {
                            //                                 print(
                            //                                     "length : ${authController.selectedSlot.length}");

                            //                                 Database()
                            //                                     .createAppoitmentInDatabase(
                            //                                   Schedule(
                            //                                     date: _selectedDay == null
                            //                                         ? DateTime.now()
                            //                                         : _selectedDay,
                            //                                     slots: authController
                            //                                         .selectedSlot,
                            //                                   ),
                            //                                 );
                            //                                 authController.selectedSlot =
                            //                                     <Slots>[].obs;
                            //                                 Get.back();
                            //                               }),
                            //                           CircularButtons(
                            //                             backgroundColor:
                            //                                 const Color(0xfffc6359),
                            //                             borderColor:
                            //                                 const Color(0xfffc6359),
                            //                             text: "No",
                            //                             height: 50,
                            //                             width: width * 0.1,
                            //                             textColor: Colors.white,
                            //                             textStyle: WhiteText,
                            //                             onPressed: () {
                            //                               Navigator.pop(context);
                            //                             },
                            //                           ),
                            //                         ],
                            //                       )
                            //                     ],
                            //                   ),
                            //                 ));
                            //             // showDialog(
                            //             //     context: context,
                            //             //     builder: (BuildContext context) {
                            //             //       return AlertDialog(
                            //             //           shape: RoundedRectangleBorder(
                            //             //               borderRadius: BorderRadius.all(
                            //             //                   Radius.circular(20.0))),
                            //             //           backgroundColor: Colors.white,
                            //             //           content: Container(
                            //             //             height: 200,
                            //             //             width: 200,
                            //             //             child: Column(
                            //             //               mainAxisAlignment:
                            //             //                   MainAxisAlignment.spaceAround,
                            //             //               children: [
                            //             //                 Text(
                            //             //                   'Assesment',
                            //             //                   style: TextStyle(
                            //             //                       color: fLabelTextColor,
                            //             //                       fontSize: 25,
                            //             //                       fontWeight: FontWeight.bold),
                            //             //                 ),
                            //             //                 //SizedBox(height: 5.h),
                            //             //                 Text(
                            //             //                   "Please indicate the result of the test",
                            //             //                   style: GoogleFonts.inter(
                            //             //                       fontSize: 18,
                            //             //                       fontStyle: FontStyle.normal,
                            //             //                       fontWeight: FontWeight.w600,
                            //             //                       color: fButtonTextColor),
                            //             //                 ),
                            //             //                 Row(
                            //             //                   mainAxisAlignment:
                            //             //                       MainAxisAlignment.spaceAround,
                            //             //                   children: [
                            //             //                     Icon(
                            //             //                       Icons.add_circle,
                            //             //                       color: fButtonColor,
                            //             //                       size: 50,
                            //             //                     ),
                            //             //                     Icon(
                            //             //                       Icons.remove_circle,
                            //             //                       color: fButtonColor,
                            //             //                       size: 50,
                            //             //                     ),
                            //             //                   ],
                            //             //                 ),
                            //             //                 Padding(
                            //             //                   padding: const EdgeInsets.only(
                            //             //                     left: 40,
                            //             //                     right: 40,
                            //             //                   ),
                            //             //                   child: Row(
                            //             //                     mainAxisAlignment:
                            //             //                         MainAxisAlignment.spaceBetween,
                            //             //                     children: [
                            //             //                       ElevatedButton(
                            //             //                           onPressed: () {
                            //             //                             print(
                            //             //                                 "length : ${authController.selectedSlot.length}");
                            //             //                             Database()
                            //             //                                 .createAppoitmentInDatabase(
                            //             //                               Schedule(
                            //             //                                 date: _selectedDay == null
                            //             //                                     ? DateTime.now()
                            //             //                                     : _selectedDay,
                            //             //                                 slots: authController
                            //             //                                     .selectedSlot,
                            //             //                               ),
                            //             //                             );
                            //             //                             Get.back();
                            //             //                           },
                            //             //                           child: Text(
                            //             //                             "Confirm",
                            //             //                             style: GoogleFonts.inter(
                            //             //                                 fontSize: 15.sp,
                            //             //                                 fontStyle:
                            //             //                                     FontStyle.normal,
                            //             //                                 fontWeight:
                            //             //                                     FontWeight.w500,
                            //             //                                 color: Colors.white),
                            //             //                           ),
                            //             //                           style: ElevatedButton.styleFrom(
                            //             //                               fixedSize: Size(140, 40),
                            //             //                               primary: fButtonColor,
                            //             //                               shape:
                            //             //                                   RoundedRectangleBorder(
                            //             //                                       borderRadius:
                            //             //                                           BorderRadius
                            //             //                                               .circular(
                            //             //                                                   20)))),
                            //             //                       ElevatedButton(
                            //             //                           onPressed: () {
                            //             //                             Navigator.of(context).pop();
                            //             //                           },
                            //             //                           child: Text(
                            //             //                             "Cancel",
                            //             //                             style: GoogleFonts.inter(
                            //             //                                 fontSize: 15.sp,
                            //             //                                 fontStyle:
                            //             //                                     FontStyle.normal,
                            //             //                                 fontWeight:
                            //             //                                     FontWeight.w500,
                            //             //                                 color: Colors.white),
                            //             //                           ),
                            //             //                           style: ElevatedButton.styleFrom(
                            //             //                               fixedSize: Size(140, 40),
                            //             //                               primary: fButtonColor,
                            //             //                               shape:
                            //             //                                   RoundedRectangleBorder(
                            //             //                                       borderRadius:
                            //             //                                           BorderRadius
                            //             //                                               .circular(
                            //             //                                                   20)))),
                            //             //                     ],
                            //             //                   ),
                            //             //                 ),
                            //             //               ],
                            //             //             ),
                            //             //           ));
                            //           });
                            //     },
                            //     textColor: Colors.white,
                            //     textStyle:
                            //         TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                            //   ),
                            // ),
                            _.authController.selectedSlot.length != 0
                                ? Container(
                                    height: 50,
                                    width: 200,
                                    child: ListView.builder(
                                        itemCount: _
                                            .authController.selectedSlot.length,
                                        itemBuilder: (context, index) {
                                          return Text(_.authController
                                                  .selectedSlot[index].startSlot
                                                  .toString() +
                                              " : " +
                                              _.authController
                                                  .selectedSlot[index].endSlot
                                                  .toString());
                                        }),
                                  )
                                : Container()
                          ],
                        ),
                      )),
                ));
        });
  }

  showTimeRangeBox(AppointmentController _, context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Select Your Availabilty Timings",
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          CircularButtons(
            backgroundColor: const Color(0xfffc6359),
            borderColor: const Color(0xfffc6359),
            text: "No",
            height: 50,
            width: Get.width * 0.1,
            textColor: Colors.white,
            textStyle: WhiteText,
            onPressed: () {
              Get.back();
            },
          ),
          CircularButtons(
            backgroundColor: Colors.blue,
            borderColor: Colors.blue,
            text: "Yes",
            height: 50,
            width: Get.width * 0.1,
            textColor: Colors.white,
            textStyle: WhiteText,
            onPressed: () {
              Get.back();
            },
          ),
        ],
        content: Container(
            height: 200,
            width: Get.width / 2.5,
            child: Column(
              children: [],
            )),
      ),
    );
  }
}

// class SetAvailability extends StatefulWidget {
//   @override
//   _SetAvailabilityState createState() => _SetAvailabilityState();
// }
//
// class _SetAvailabilityState extends State<SetAvailability>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//
//
//     @override
//     void initState() {
//
//
//       super.initState();
//     }
//
//     @override
//     @override
//     void dispose() {
//       super.dispose();
//     }
//
//
//
//     // void _addAppointments() {
//     //   _shiftCollection = <Appointment>[];
//     //   final Random random = Random();
//     //   for (int i = 0; i < _employeeCollection.length; i++) {
//     //     final List<String> _employeeIds = <String>[
//     //       _employeeCollection[i].id.toString()
//     //     ];
//     //     if (i == _employeeCollection.length - 1) {
//     //       int index = random.nextInt(5);
//     //       index = index == i ? index + 1 : index;
//     //       _employeeIds.add(_employeeCollection[index].id.toString());
//     //     }
//
//     //     for (int k = 0; k < 365; k++) {
//     //       if (_employeeIds.length > 1 && k % 2 == 0) {
//     //         continue;
//     //       }
//     //       for (int j = 0; j < 2; j++) {
//     //         final DateTime date = DateTime.now().add(Duration(days: k + j));
//     //         int startHour = 9 + random.nextInt(6);
//     //         startHour =
//     //             startHour >= 13 && startHour <= 14 ? startHour + 1 : startHour;
//     //         final DateTime _shiftStartTime =
//     //             DateTime(date.year, date.month, date.day, startHour, 0, 0);
//     //         _shiftCollection.add(Appointment(
//     //             startTime: _shiftStartTime,
//     //             endTime: _shiftStartTime.add(const Duration(hours: 1)),
//     //             subject: _subjectCollection[random.nextInt(8)],
//     //             color: _colorCollection[random.nextInt(8)],
//     //             startTimeZone: '',
//     //             endTimeZone: '',
//     //             resourceIds: _employeeIds));
//     //       }
//     //     }
//     //   }
//     // }
//
//
//
//
//
//
//
//
//
//     return
//   }
//
//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => true;
// }
//
// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }
//
//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }
//
//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }
// }
//
// class Meeting {
//   Meeting(
//     this.from,
//     this.to,
//   );
//
//   DateTime from;
//   DateTime to;
// }
//
// class _DataSource extends CalendarDataSource {
//   _DataSource(List<Appointment> source, List<CalendarResource> resourceColl) {
//     appointments = source;
//     resources = resourceColl;
//   }
// }
//
// class _AppointmentDataSource extends CalendarDataSource {
//   _AppointmentDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
