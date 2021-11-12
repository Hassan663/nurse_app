import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/constants/custom_snackbar.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/controllers/authentication/auth_controller.dart';
import 'package:rtt_nurse_app/models/appointment/available_requests.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

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

  var formatted = formatDate(DateTime.now(), [mm]);
  var formatted1;
  List<String> subjectCollection = <String>[];
  List<Color> colorCollection = <Color>[];
  // List<Appointment> shiftCollection = <Appointment>[];
  List<CalendarResource> employeeCollection = <CalendarResource>[];
  List months = [];
  List c = [];

  List<Appointment> meeting = <Appointment>[];
  // DataSource? events;

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

  void getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes: 10)),
      subject: 'Meeting',
      color: Colors.blue,
      startTimeZone: '',
      endTimeZone: '',
    ));
  }

  Future<void> addAppointment() async {
    isLoading = true;
    update();

    var data = nurseAppointment.doc();
    var docSnap = await data.get();
    data.set({
      "docId": docSnap.reference.id,
      "appointmentData" : selectedDays,
      "startappointmentTime" : availablefromController.text,
      "endappointmentTime" : availabletoController.text,
      "nurseId" : firebaseAuth.currentUser!.uid
    }).then((value){
      isLoading = false;
      update();
      Get.back();
      CustomSnackBar.showSnackBar(
          title: "Success",
          message: 'appointment Added Successfully',
          backgroundColor: snackBarSuccess);
    });
  }

  Future<void> getAppoinment() async{

    Stream<QuerySnapshot> streambodytarget = nurseAppointment.where("nurseId" , isEqualTo: firebaseAuth.currentUser!.uid)
        .snapshots();
    await streambodytarget.forEach((e) {
      c.clear();
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
      String hourstring = c[i]['startappointmentTime'].toString().split(':').first;
      String minnstring = c[i]['startappointmentTime'].toString().split(':').last;
      String minnstring1 = minnstring.toString().split(" ").first;
      int hour = int.parse(hourstring);
      int min = int.parse(minnstring1);
      print("Today $today");
      print("Time $hour");
      print("Min $min");


      String hourstring1 = c[i]['endappointmentTime'].toString().split(':').first;
      String minnstring13 = c[i]['endappointmentTime'].toString().split(':').last;
      String minnstring2 = minnstring13.toString().split(" ").first;
      int hour1 = int.parse(hourstring1);
      int min1 = int.parse(minnstring2);
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
