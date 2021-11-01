import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtt_nurse_app/controllers/authentication/auth_controller.dart';
import 'package:rtt_nurse_app/controllers/service/database.dart';
import 'package:rtt_nurse_app/models/authentication/avalibleSlots.dart';
import 'package:rtt_nurse_app/models/authentication/schedule.dart';

import 'package:rtt_nurse_app/utils/rrt_colors.dart';
import 'package:rtt_nurse_app/utils/rrt_sizes.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/header.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/textfield.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String month = formatDate(DateTime.now(), [mm]);
String day = formatDate(DateTime.now(), [dd]);
DateTime? _selectedDay;

class SetAvailability extends StatefulWidget {
  @override
  _SetAvailabilityState createState() => _SetAvailabilityState();
}

class _SetAvailabilityState extends State<SetAvailability> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController? availablefromController = TextEditingController();
    TextEditingController? availabletoController = TextEditingController();
    final authController = Get.find<AuthController>();

    CalendarFormat _calendarFormat = CalendarFormat.month;
    RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
        .toggledOff; // Can be toggled on/off by longpressing a date
    DateTime _focusedDay = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    TimeOfDay selectedTime1 = TimeOfDay.now();
    String from1 = "From";
    String to = "to";

    var formatted = formatDate(DateTime.now(), [mm]);
    var formatted1;

    @override
    void initState() {
      super.initState();
      _selectedDay = _focusedDay;
      //_selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    }

    @override
    void dispose() {
      //_selectedEvents.dispose();
      super.dispose();
    }

    List months = [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec'
    ];
    void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
      if (!isSameDay(_selectedDay, selectedDay)) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;

          formatted = formatDate(selectedDay, [mm]);
          print(formatted);
          formatted1 = formatDate(selectedDay, [dd]);
          print(formatted1);

          var current_mon = selectedDay.month;
          print(months[current_mon - 1]);
          month = (months[current_mon - 1]);
          day = formatted1;

          print("Selected wwmonth $month");
          print("selectedwwsr day $day");
        });
      }
    }

    void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
      setState(() {
        _selectedDay = null;
        _focusedDay = focusedDay;
        // _rangeStart = start;
        // _rangeEnd = end;
        _rangeSelectionMode = RangeSelectionMode.toggledOn;
      });
    }

    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
              color: Color(0xffE5E5E5), //new Color.fromRGBO(255, 0, 0, 0.0),
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(circular_radius_homeContainers),
                  bottomLeft: Radius.circular(circular_radius_homeContainers))),
          child: Padding(
            padding: EdgeInsets.all(35.0.sp),
            child: Column(
              children: [
                Header(),
                // SizedBox(
                //   height: 35.h,
                // ),
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
                    Container(
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors
                              .white, //new Color.fromRGBO(255, 0, 0, 0.0),
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5),
                          )),
                      height: MediaQuery.of(context).size.height * 0.57,
                      width: width * 0.36,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TableCalendar(
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                          selectedDayPredicate: (day) =>
                              isSameDay(_selectedDay, day),
                          onRangeSelected: _onRangeSelected,
                          onDaySelected: _onDaySelected,
                          calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
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
                                child: Icon(Icons.chevron_right),
                              ),
                              leftChevronIcon: CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(Icons.chevron_left),
                              )),
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          availableGestures: AvailableGestures.horizontalSwipe,
                          headerVisible: true,
                          focusedDay: _focusedDay,
                        ),
                      ),
                    ),
                    //second row choice chip
                    Container(
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(
                            Radius.circular(5),
                          )),
                      height: MediaQuery.of(context).size.height * 0.57,
                      width: width * 0.36,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical:
                                MediaQuery.of(context).size.height * 0.03),
                        child: Column(
                          children: [
                            Text(
                              "Enter Your Availabilty Timings",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      //  startSlotspreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.red,
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(5),
                                  )),
                              height: 250.h,
                              width: 250.h,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      month.toUpperCase(),
                                      style: WhiteTitleText,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(day, style: WhiteTitleText),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    width: 200.w,
                                    child: textformfield1(
                                      availablefromController,
                                      "Available To",
                                      "To",
                                      false,
                                      TextInputType.name,
                                    ),
                                  ),
                                ),
                                Text("To",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700)),
                                Flexible(
                                  child: Container(
                                    width: 200.w,
                                    child: textformfield1(
                                      availabletoController,
                                      "Available To",
                                      "To",
                                      false,
                                      TextInputType.name,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: CircularButtons(
                                backgroundColor: const Color(0xfffc6359),
                                borderColor: const Color(0xfffc6359),
                                text: "Save",
                                height: 40,
                                width: width * 0.1,
                                onPressed: () {
                                  setState(() {
                                    Slots s = Slots(
                                        startSlot: availablefromController.text
                                            .toString(),
                                        endSlot: availabletoController.text
                                            .toString());
                                    authController.selectedSlot.add(s);
                                    print(authController.selectedSlot.length);
                                    availablefromController.clear();
                                    availabletoController.clear();
                                  });
                                },
                                textColor: Colors.white,
                                textStyle: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 70.h),
                  child: CircularButtons(
                    backgroundColor: const Color(0xfffc6359),
                    borderColor: const Color(0xfffc6359),
                    text: "Set Availability",
                    height: 50,
                    width: width * 0.3,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                backgroundColor: Colors.white,
                                content: Container(
                                  height: 300,
                                  width: 500,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Assesment',
                                        style: TextStyle(
                                            color: fLabelTextColor,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //SizedBox(height: 5.h),
                                      Text(
                                        "Please indicate the result of the test",
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            color: fButtonTextColor),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            color: fButtonColor,
                                            size: 50,
                                          ),
                                          Icon(
                                            Icons.remove_circle,
                                            color: fButtonColor,
                                            size: 50,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  print(
                                                      "length : ${authController.selectedSlot.length}");
                                                  Database()
                                                      .createAppoitmentInDatabase(
                                                    Schedule(
                                                      date: _selectedDay,
                                                      slots: authController
                                                          .selectedSlot,
                                                    ),
                                                  );
                                                  Get.back();
                                                },
                                                child: Text(
                                                  "Confirm",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 15.sp,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    fixedSize: Size(140, 40),
                                                    primary: fButtonColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)))),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 15.sp,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                    fixedSize: Size(140, 40),
                                                    primary: fButtonColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          });
                    },
                    textColor: Colors.white,
                    textStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
                authController.selectedSlot.length != 0
                    ? Container(
                        height: 50,
                        width: 200,
                        child: ListView.builder(
                            itemCount: authController.selectedSlot.length,
                            itemBuilder: (context, index) {
                              return Text(authController
                                      .selectedSlot[index].startSlot
                                      .toString() +
                                  " : " +
                                  authController.selectedSlot[index].endSlot
                                      .toString());
                            }),
                      )
                    : Container()
              ],
            ),
          )),
    ));
  }
}
