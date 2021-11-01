import 'package:flutter/material.dart';
import 'package:rtt_nurse_app/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/rrt_widgets/textfield.dart';
import 'package:rtt_nurse_app/ui/auth/rtt_nurse_register.dart';
import 'package:rtt_nurse_app/ui/homescreen/home_screen.dart';
import 'package:rtt_nurse_app/utils/rtt_routes.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';

import 'rtt_nurse_forget_password.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController? usernameController = TextEditingController();

  TextEditingController? passwordController = TextEditingController();

  late String _passwordError;
  bool isClick = false;
  bool validateAndSaveLogin() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  _updatestate(bool isvalid) {
    setState(() {
      isClick = isvalid;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Center(
          child: Container(
            height: height * 0.75,
            width: width * 0.4,
            child: SingleChildScrollView(
              child: Card(
                shadowColor: Colors.grey,
                elevation: 10,
                color: Colors.white,
                child: Form(
                  //autovalidate: true,
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset("assets/rtt.png"),
                      ),
                      Text("Log In", style: TitleText),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 39),
                        child: textformfield(
                          usernameController,
                          'Enter username',
                          'Username',
                          false,
                          TextInputType.name,
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
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 39),
                        child: textformfield(
                          passwordController,
                          'Enter password',
                          'Password',
                          true,
                          TextInputType.name,
                          (value) {
                            return (value!.isEmpty)
                                ? "Password can't be Empty"
                                : null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppRoutes.push(context, RegisterAccount());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Create Account.",
                                style: RedText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Forgot your password? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppRoutes.push(context, ForgotPassword());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Reset password.",
                                style: RedText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CircularButtons(
                          backgroundColor: const Color(0xfffc6359),
                          borderColor: const Color(0xfffc6359),
                          text: "Log In",
                          height: 50,
                          width: width * 0.2,
                          onPressed: () {
                            _updatestate(true);
                            if (validateAndSaveLogin()) {
                              AppRoutes.push(context, HomePage());
                              _updatestate(false);
                            } else {
                              print("object");
                              _updatestate(false);
                            }
                          },
                          textColor: Colors.white,
                          textStyle: WhiteText),
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
  }
}
