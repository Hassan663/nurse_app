import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/view/ui/homescreen/home_screen.dart';
import 'controllers/authentication/auth_controller.dart';
import 'view/ui/auth/auth_decider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RTT NURSE APP ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthDecider(),
      ),
      designSize: const Size(1920, 1080),
    );
  }
}
