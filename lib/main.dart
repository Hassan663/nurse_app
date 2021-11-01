import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rtt_nurse_app/ui/auth/rtt_nurse_login.dart';
import 'package:rtt_nurse_app/ui/homescreen/home_screen.dart';
import 'package:rtt_nurse_app/ui/payment/rtt_nurse_billing_information.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RTT NURSE APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
      designSize: Size(1920, 1080),
    );
  }
}
