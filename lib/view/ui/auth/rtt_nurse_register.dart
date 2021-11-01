import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rtt_nurse_app/constants/custom_snackbar.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/constants/utils/auth_exception_handler.dart';
import 'package:rtt_nurse_app/controllers/authentication/auth_controller.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/textfield.dart';

import 'rtt_nurse_login.dart';

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final authController = Get.find<AuthController>();

  late String _passwordError;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool validateAndSaveUser() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void tryRegister() async {
    //Login user on auth request
    final status = await authController.createUser(
      emailController.text.trim(),
      passwordController.text,
      fNameController.text,
      lNameController.text,
    );
    if (status == AuthResultStatus.successful) {
      Get.back();
      CustomSnackBar.showSnackBar(
          title: "Account created Successfully",
          message: '',
          backgroundColor: snackBarSuccess);
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      CustomSnackBar.showSnackBar(
          title: errorMsg, message: '', backgroundColor: snackBarError);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: fBackgroundColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Container(
              height: height,
              width: width * 0.4,
              child: SingleChildScrollView(
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 10,
                  color: Colors.white,
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.h),
                          child: Image.asset("assets/rtt.png"),
                        ),
                        Text("Create Account", style: TitleText),
                        SizedBox(
                          height: 60.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 39.w),
                          child: textformfield(
                            fNameController,
                            'Enter first name',
                            'First Name',
                            false,
                            TextInputType.name,
                            (value) {
                              return (value!.isEmpty)
                                  ? "First Name can't be Empty"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 39.w),
                          child: textformfield(
                            lNameController,
                            'Enter last name',
                            'Last Name',
                            false,
                            TextInputType.name,
                            (value) {
                              return (value!.isEmpty)
                                  ? "Last Name can't be Empity"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 39.w),
                          child: textformfield(
                            emailController,
                            'Enter your email',
                            'Email',
                            false,
                            TextInputType.emailAddress,
                            (value) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern as String);
                              return (!regex.hasMatch(value!))
                                  ? "Please Enter Valid Email"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 39.w),
                          child: textformfield(
                            passwordController,
                            'Enter Password',
                            'Password',
                            true,
                            TextInputType.name,
                            (value) {
                              return (value!.isEmpty)
                                  ? "Password can't be Empity"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 39.w),
                          child: textformfield(
                            confirmpasswordController,
                            'Confirm Password',
                            'Confirm Password',
                            true,
                            TextInputType.name,
                            (value) {
                              if (value.isEmpty) {
                                return 'Confirm Password cannot be Empity';
                              }
                              if (value != passwordController.text) {
                                return 'Password Not Match';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.off(Login());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0.w),
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: Color(0xfffc6359),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CircularButtons(
                          backgroundColor: const Color(0xfffc6359),
                          borderColor: const Color(0xfffc6359),
                          text: "Next",
                          height: 50,
                          width: width * 0.2,
                          textColor: Colors.white,
                          textStyle: WhiteText,
                          onPressed: () {
                            if (validateAndSaveUser()) {
                              print("Avuth ready");
                              tryRegister();
                            } else {
                              CustomSnackBar.showSnackBar(
                                  title: "Please fill all blanks",
                                  message: '',
                                  backgroundColor: Colors.red);
                              debugPrint("auth error");
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// InkWell(
//   // onTap: () {
//   //   Get.to(UserBillingInformation());
//   // },
//   onTap: () {
//     if (fNameController!.text.length < 1 ||
//         emailController!.text.endsWith(".com") == false ||
//         passwordController!.text.length < 1 ||
//         confirmpasswordController!.text.length < 1 ||
//         lNameController!.text.length < 1) {
//       _passwordError = "Enter atleast";
//     } else
//       Get.to(UserBillingInformation());
//   },

// child: Container(
//   alignment: Alignment.center,
//   width: MediaQuery.of(context).size.width * 0.2,
//   padding: const EdgeInsets.symmetric(vertical: 15.0),
//   decoration: BoxDecoration(
//       color: const Color(0xfffc6359),
//       borderRadius: BorderRadius.circular(30.0)),
//   child: const Text(
//     'Next',
//     style: TextStyle(color: Colors.white),
//   ),
// ),
//),
// InkWell(
//   onTap: () {
//     Get.to(UserBillingInformation());
//   },
//   child: Padding(
//     padding: EdgeInsets.symmetric(horizontal: 120.w),
//     child: Container(
//       alignment: Alignment.center,
//       // height: 65.h,
//       width: width,
//       padding: EdgeInsets.symmetric(vertical: 15.0.h),
//       decoration: BoxDecoration(
//           color: Color(0xfffc6359),
//           borderRadius: BorderRadius.circular(30.0.sp)),
//       child: Text(
//         'Next',
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   ),
// )
