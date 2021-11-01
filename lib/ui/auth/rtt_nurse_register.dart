import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rtt_nurse_app/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/rrt_widgets/textfield.dart';
import 'package:rtt_nurse_app/ui/auth/rtt_nurse_login.dart';
import 'package:rtt_nurse_app/ui/payment/rtt_nurse_billing_information.dart';
import 'package:rtt_nurse_app/utils/rrt_colors.dart';
import 'package:rtt_nurse_app/utils/rtt_routes.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  TextEditingController? fNameController = TextEditingController();

  TextEditingController? lNameController = TextEditingController();

  TextEditingController? emailController = TextEditingController();

  TextEditingController? passwordController = TextEditingController();

  TextEditingController? confirmpasswordController = TextEditingController();

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
                              RegExp regex = new RegExp(pattern as String);
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
                              return (value!.isEmpty)
                                  ? "Password can't be Empity"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppRoutes.push(context, Login());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0.w),
                                child: Text(
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
                              AppRoutes.push(context, UserBillingInformation());
                            } else {
                              print("1");
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
