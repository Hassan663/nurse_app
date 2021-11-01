import 'package:get/get.dart';
import 'package:rtt_nurse_app/controllers/service/appointment_database.dart';
import 'package:rtt_nurse_app/models/appointment/available_appointments.dart';

class AppointmentController extends GetxController {
  var availableAppointments = <AvailableAppointments>[].obs;

  @override
  void onInit() {
    availableAppointments.bindStream(AppointmentDatabase().getAllPost());
    super.onInit();
  }
}
