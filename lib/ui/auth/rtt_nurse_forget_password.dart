import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rtt_nurse_app/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/rrt_widgets/textfield.dart';
import 'package:rtt_nurse_app/ui/homescreen/home_screen.dart';
import 'package:rtt_nurse_app/utils/rtt_routes.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController? passwordController = TextEditingController();

  TextEditingController? confirmpasswordController = TextEditingController();

  late String _passwordError;
  bool validate() {
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
        backgroundColor: Color(0xffE5E5E5),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: height * 0.7,
              width: width * 0.4,
              child: Card(
                shadowColor: Colors.grey,
                elevation: 10,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: Image.asset("assets/rtt.png"),
                    ),
                    Text("Forgot Password", style: TitleText),
                    SizedBox(
                      height: 60.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 39.w),
                      child: textformfield(
                        passwordController,
                        'Enter username',
                        'Username',
                        false,
                        TextInputType.name,
                        (value) {
                          return (value!.isEmpty)
                              ? "Username can't be Empity"
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
                        'Enter password',
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
                      height: 50.h,
                    ),
                    CircularButtons(
                        backgroundColor: const Color(0xfffc6359),
                        borderColor: const Color(0xfffc6359),
                        text: "Login",
                        height: 50,
                        width: width * 0.2,
                        textColor: Colors.white,
                        textStyle: WhiteText,
                        onPressed: () {
                          if (validate()) {
                            CircularProgressIndicator(
                              backgroundColor: Colors.red,
                            );
                            AppRoutes.push(context, HomePage());
                          } else {
                            print("forget");
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
    );
    ;
  }
}
