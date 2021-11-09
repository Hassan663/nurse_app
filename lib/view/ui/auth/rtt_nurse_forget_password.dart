import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rtt_nurse_app/constants/custom_snackbar.dart';
import 'package:rtt_nurse_app/constants/rrt_colors.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/textfield.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? newpasswordController = TextEditingController();
  TextEditingController? confirmpasswordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _passwordError;
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: Center(
          child: Container(
            height: height * 0.8,
            width: width * 0.4,
            child: SingleChildScrollView(
              child: Card(
                shadowColor: Colors.grey,
                elevation: 10,
                color: Colors.white,
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        child: Image.asset("assets/rtt.png"),
                      ),
                      Text(
                        "Update Password",
                        style: GoogleFonts.openSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 39.w),
                        child: textformfield(
                          passwordController,
                          ' Enter Old Password',
                          ' OldPassword',
                          false,
                          TextInputType.name,
                          (value) {
                            return (value!.isEmpty)
                                ? "This field can't be Empity"
                                : null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 39.w),
                        child: textformfield(
                          newpasswordController,
                          'Enter New password',
                          'New Password',
                          true,
                          TextInputType.name,
                          (value) {
                            return (value!.isEmpty)
                                ? "This field can't be Empity"
                                : null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 39.w),
                        child: textformfield(
                          confirmpasswordController,
                          'Confirm New password',
                          'Confirm New Password',
                          true,
                          TextInputType.name,
                           (value) {
                              if (value.isEmpty) {
                                return 'Confirm Password cannot be Empity';
                              }
                              if (value != newpasswordController!.text) {
                                return 'Password Not Match';
                              }
                              return null;
                            },
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      CircularButtons(
                          backgroundColor: const Color(0xfffc6359),
                          borderColor: const Color(0xfffc6359),
                          text: "Save",
                          height: 50,
                          width: width * 0.2,
                          textColor: Colors.white,
                          textStyle: WhiteText,
                          onPressed: () {
                            if (validateAndSaveUser()) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        backgroundColor: Colors.white,
                                        content: Container(
                                          height: 200,
                                          width: 400,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Do you want to update password',
                                                    style: TextStyle(
                                                        color: fButtonColor,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  CircularButtons(
                                                    backgroundColor:
                                                        const Color(0xff4F8484),
                                                    borderColor:
                                                        const Color(0xff4F8484),
                                                    text: "Yes",
                                                    height: 50,
                                                    width: width * 0.1,
                                                    textColor: Colors.white,
                                                    textStyle: WhiteText,
                                                    onPressed: () {
                                                      CustomSnackBar.showSnackBar(
                                                          title:
                                                              "Password Updated Sucessfully",
                                                          message: '',
                                                          backgroundColor:
                                                              snackBarSuccess);
                                                    },
                                                  ),
                                                  CircularButtons(
                                                    backgroundColor:
                                                        const Color(0xfffc6359),
                                                    borderColor:
                                                        const Color(0xfffc6359),
                                                    text: "No",
                                                    height: 50,
                                                    width: width * 0.1,
                                                    textColor: Colors.white,
                                                    textStyle: WhiteText,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  });
                            } else {
                              CustomSnackBar.showSnackBar(
                                  title: "Please Fill All Fields",
                                  message: '',
                                  backgroundColor: snackBarError);
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}


