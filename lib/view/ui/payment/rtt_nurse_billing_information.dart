import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:rtt_nurse_app/utils/rrt_colors.dart';
import 'package:rtt_nurse_app/utils/rtt_routes.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/button.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/textfield.dart';
import 'package:rtt_nurse_app/view/ui/auth/rtt_nurse_login.dart';
import 'package:rtt_nurse_app/view/ui/homescreen/home_screen.dart';

// ignore: must_be_immutable
class UserBillingInformation extends StatelessWidget {
  TextEditingController? cardNumberController = TextEditingController();
  TextEditingController? cardHolderNameController = TextEditingController();
  TextEditingController? cvvController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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

  final cardnumberFormatter =
      MaskTextInputFormatter(mask: ("#### #### #### ####"));
  final cvcFormatter = MaskTextInputFormatter(mask: ("###"));

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100.h, bottom: 50.h),
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
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Image.asset("assets/rtt.png"),
                        ),
                        Text("Create Account", style: TitleText),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0.h),
                            child: Text(
                              'Billing Information',
                              style: SubTitleText,
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 39.w),
                            child: TextFormField(
                                autovalidate: true,
                                validator: (value) {
                                  return (value!.isEmpty)
                                      ? "Card Holder Number can't be Empity"
                                      : null;
                                },
                                inputFormatters: [cardnumberFormatter],
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                cursorColor: fLabelTextColor,
                                //controller: _controller,
                                decoration: InputDecoration(
                                    hintText: 'Enter Card Number',
                                    labelText: 'Card Number',
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF797a7a)),
                                    labelStyle: const TextStyle(
                                        color: Color(0xff83b7b8)),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      borderSide: const BorderSide(
                                          color: Color(0xff83b7b8)),
                                      gapPadding: 10.sp,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      borderSide: const BorderSide(
                                          color: Color(0xff83b7b8)),
                                      gapPadding: 10,
                                    )))),
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 39.w),
                          child: textformfield(
                            cardNumberController,
                            'Enter Card Holder Name',
                            'Card Holder Name',
                            false,
                            TextInputType.number,
                            (value) {
                              return (value!.isEmpty)
                                  ? "Card can't be Empity"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 39.w),
                            child: TextFormField(
                                inputFormatters: [cvcFormatter],
                                autovalidate: true,
                                validator: (value) {
                                  return (value!.isEmpty)
                                      ? "Cvc can't be Empity"
                                      : null;
                                },
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                cursorColor: fLabelTextColor,
                                //controller: _controller,
                                decoration: InputDecoration(
                                    hintText: 'Enter Cvv',
                                    labelText: 'Cvv',
                                    hintStyle:
                                        TextStyle(color: Color(0xFF797a7a)),
                                    labelStyle:
                                        TextStyle(color: Color(0xff83b7b8)),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      borderSide: const BorderSide(
                                          color: Color(0xff83b7b8)),
                                      gapPadding: 10.sp,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      borderSide: const BorderSide(
                                          color: Color(0xff83b7b8)),
                                      gapPadding: 10,
                                    )))),
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.0.h),
                                      child: Text("Log In", style: RedText),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/paypal.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                        Image.asset(
                                          "assets/mastercard1.png",
                                          height: 50,
                                          width: 50,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CircularButtons(
                          backgroundColor: const Color(0xfffc6359),
                          borderColor: const Color(0xfffc6359),
                          text: "Create Account",
                          height: 50,
                          width: width * 0.2,
                          textColor: Colors.white,
                          textStyle: WhiteText,
                          onPressed: () {
                            if (validate()) {
                              AppRoutes.push(context, HomePage());
                            } else {
                              print("object");
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
