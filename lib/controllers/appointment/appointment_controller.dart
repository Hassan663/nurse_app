import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/constants/custom_snackbar.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/controllers/authentication/auth_controller.dart';
import 'package:rtt_nurse_app/models/appointment/available_requests.dart';
import 'package:rtt_nurse_app/utils/rrt_sizes.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_range/time_range.dart';

class AppointmentController extends GetxController {
  var availableAppointments = <AvailableRequests>[].obs;

  bool isLoading = true;


  final nurseAppointment = FirebaseFirestore.instance.collection("NurseAppointment");

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  TextEditingController availablefromController = TextEditingController();
  TextEditingController availabletoController = TextEditingController();
  final authController = Get.find<AuthController>();

  String month = formatDate(DateTime.now(), [mm]);
  String day = formatDate(DateTime.now(), [dd]);
  DateTime? selectedDays;

  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime focusedDays = DateTime.now();
  TimeOfDay startingTimeRange = TimeOfDay(hour: 10, minute: 10);
  TimeOfDay endingTimeRange = TimeOfDay.now();
  // List<Meeting> meetings = <Meeting>[];
  TimeOfDay selectedStartTime = TimeOfDay(hour: 13, minute: 10);
  TimeOfDay selectendingTimeRange = TimeOfDay.now();

  // List<Appointment> shiftCollection = <Appointment>[];
  List<CalendarResource> employeeCollection = <CalendarResource>[];
  List months = [];
  List c = [];

  List<Appointment> meeting = <Appointment>[];
  // DataSource? events;

  // Time Range
  TimeRangeResult? timeRange;
  String starttime = "";
  String endTime = "";

  List slotlist = [];

  @override
  void onInit() {
    // events = DataSource(shiftCollection, employeeCollection);
    selectedDays = focusedDays;
    months = [
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
    final defaultTimeRange = TimeRangeResult(
      TimeOfDay(hour: 9, minute: 00),
      TimeOfDay(hour: 17, minute: 00),
    );
    timeRange = defaultTimeRange;
    update();
    // availableAppointments.bindStream(AppointmentDatabase().getAllPost());
    super.onInit();
  }

  @override
  void onReady() async{
    getAppoinment();
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  void onClose() {

    super.onClose();
  }

  // List<Meeting> getDataSource() {
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime =
  //   DateTime(today.year, today.month, today.day, 1, 0, 0);
  //   final DateTime endTime = startTime.add(const Duration(hours: 2));
  //   meetings.add(Meeting(
  //     startTime,
  //     endTime,
  //   ));
  //   return meetings;
  // }
  //
  // void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
  //   if (!isSameDay(selectedDay, selectedDay)) {
  //     selectedDays = selectedDay;
  //     focusedDays = focusedDay;
  //
  //     formatted = formatDate(selectedDay, [mm]);
  //     print(formatted);
  //     formatted1 = formatDate(selectedDay, [dd]);
  //     print(formatted1);
  //
  //     var current_mon = selectedDay.month;
  //     print(months[current_mon - 1]);
  //     month = (months[current_mon - 1]);
  //     day = formatted1;
  //
  //     print("Selected wwmonth $month");
  //     print("selectedwwsr day $day");
  //     update();
  //   }
  // }
  //
  // void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
  //   selectedDays = null;
  //   focusedDay = focusedDay;
  //   rangeSelectionMode = RangeSelectionMode.toggledOn;
  //   update();
  // }

  Future<void> addAppointment(BuildContext c) async {
    isLoading = true;
    slotlist.clear();
    update();
    final Timestamp d = Timestamp. fromDate(selectedDays!);
    print("${d.toDate()}");
    final DateTime today =DateTime.parse(d.toDate().toString());
    String da = today.toString().split(' at').first;
    String a = da.split(" ").first;
    print("today $today");
    print("today $da");
    print("a $a");


    var lasth = TimeOfDay(hour: timeRange!.end.hour, minute: timeRange!.end.minute);


    var hour = TimeOfDay(hour: timeRange!.start.hour, minute: timeRange!.start.minute);

    while (hour.beforeOrEqual(lasth)) {
      print("1st $hour cheeck ${hour.add(minutes: 30)}");
      // slotlist.add(
      //   "Start Time : ${hour.format(c)} End Time : ${hour.add(minutes: 30).format(c)}"
      // );
      // slotlist.add(
      //     hour.hour == TimeOfDay.hoursPerDay
      //     ? hour.replacing(hour: 0)
      //     : hour
      // );

      slotlist.add(
          hour.hour == TimeOfDay.hoursPerDay ? hour.replacing(hour: 0) : "${hour.format(c)}");

      hour = hour.add(minutes: 30);
    }
    update();
    slotlist.forEach((element) {
      print("Check hours $element");
    });



    var checkdata = await nurseAppointment.where("nurseId" , isEqualTo: firebaseAuth.currentUser!.uid).where("adate" , isEqualTo: a).get();
    print("${checkdata.docs.length}");
    if(checkdata.docs.length == 0)
      {
        var data = nurseAppointment.doc();
        var docSnap = await data.get();
        data.set({
          "docId": docSnap.reference.id,
          "adate" :a,
          "appointmentData" : selectedDays,
          "startappointmentTime" : timeRange!.start.format(c),
          "startappoinmenthour" : timeRange!.start.hour,
          "startappoinmentMin" : timeRange!.start.minute,
          "endappointmentTime" : timeRange!.end.format(c),
          "endappoinmenthour" : timeRange!.end.hour,
          "endappoinmentMin" : timeRange!.end.minute,
          "nurseId" : firebaseAuth.currentUser!.uid,
          "slots" : slotlist,
        }).then((value){
          isLoading = false;
          update();
          Get.back();
          CustomSnackBar.showSnackBar(
              title: "Success",
              message: 'appointment Added Successfully',
              backgroundColor: snackBarSuccess);
        });
        isLoading = false;
        update();
      }
    else
      {
        String doci = "";
        checkdata.docs.forEach((element) {
          doci = element['docId'];
        });
        update();
        nurseAppointment.doc(doci).update({
          "adate" :a,
          "appointmentData" : selectedDays,
          "startappointmentTime" : timeRange!.start.format(c),
          "startappoinmenthour" : timeRange!.start.hour,
          "startappoinmentMin" : timeRange!.start.minute,
          "endappointmentTime" : timeRange!.end.format(c),
          "endappoinmenthour" : timeRange!.end.hour,
          "endappoinmentMin" : timeRange!.end.minute,
        }).then((value){
          isLoading = false;
          update();
          Get.back();
          CustomSnackBar.showSnackBar(
              title: "Success",
              message: 'appointment Added Successfully',
              backgroundColor: snackBarSuccess);
        });
        isLoading = false;
        update();
      }

  }

  Future<void> getAppoinment() async {
    print("User id ${firebaseAuth.currentUser!.uid}");
    Stream<QuerySnapshot> streambodytarget = nurseAppointment.where("nurseId" , isEqualTo: firebaseAuth.currentUser!.uid.toString())
        .snapshots();
    await streambodytarget.forEach((e) {
      c.clear();
      meeting.clear();
      for (var value in e.docs) {
        print(value.data());
        c.add(value.data());
      }
      update();
    }).catchError((e) {
      print(e);
    });
  }

  List<Appointment> setAppoinment()
  {
    for(int i=0 ; i<c.length ; i++)
    {
      // var d = e.data()['appointmentData'];
      final Timestamp d = c[i]['appointmentData'];
      final DateTime today =DateTime.parse(d.toDate().toString());
      int hour = int.parse(c[i]['startappoinmenthour'].toString());
      int min = int.parse(c[i]['startappoinmentMin'].toString());
      print("Today $today");
      print("Time $hour");
      print("Min $min");

      int hour1 = int.parse(c[i]['endappoinmenthour'].toString());
      int min1 = int.parse(c[i]['endappoinmentMin'].toString());
      print("Today $today");
      print("Time $hour");
      print("Min $min");

      final DateTime starttime = DateTime(today.year , today.month , today.day , hour , min , 0);
      final DateTime endtime = DateTime(today.year , today.month , today.day , hour1 , min1 , 0);

      meeting.add(Appointment(
        startTime: starttime,
        endTime: endtime,
        color: Colors.blue,
      ));
      update();
      // final DateTime startTime =  DateTime(today.year , today.month , today.day , )
    }
    return meeting;
  }


}
class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}
