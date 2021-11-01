import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/controllers/authentication/auth_controller.dart';
import 'package:rtt_nurse_app/view/ui/auth/rtt_nurse_login.dart';
import 'package:rtt_nurse_app/view/ui/homescreen/home_screen.dart';

class AuthDecider extends StatelessWidget {
  AuthDecider({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authController.getUserId(),
        builder: (ctx, AsyncSnapshot auth) {
          if (auth.hasData && auth.data != null) {
            authController.getUserById(auth.data);
            return HomePage();
          } else {
            return Login();
          }
        });
  }
}
