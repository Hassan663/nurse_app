import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rtt_nurse_app/utils/rrt_colors.dart';

Widget textformfield(
  TextEditingController? _controller,
  String hintText,
  //final VoidCallback,
  String labelText,
  bool obsecure,
  TextInputType type,
  //String? emptyValidationMessage,
  final validator,
) {
  return TextFormField(
      autovalidate: true,
      validator: validator,
      //emptyValidationMessage,
      // validator: (value) {
      //   Pattern pattern =
      //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      //   RegExp regex = new RegExp(pattern as String);
      //   return (!regex.hasMatch(value!)) ? emptyValidationMessage : null;
      // },
      keyboardType: type,
      obscureText: obsecure,
      cursorColor: fLabelTextColor,
      controller: _controller,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: Color(0xFF797a7a)),
          labelStyle: const TextStyle(color: Color(0xff83b7b8)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.sp),
            borderSide: const BorderSide(color: Color(0xff83b7b8)),
            gapPadding: 10.sp,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.sp),
            borderSide: const BorderSide(color: Color(0xff83b7b8)),
            gapPadding: 10,
          )));
}

Widget textformfield1(
  TextEditingController? _controller,
  String hintText,
  //final VoidCallback,
  String labelText,
  bool obsecure,
  TextInputType type,
  //String? emptyValidationMessage,
  //final validator,
) {
  return TextFormField(
      autovalidate: true,

      //emptyValidationMessage,
      // validator: (value) {
      //   Pattern pattern =
      //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      //   RegExp regex = new RegExp(pattern as String);
      //   return (!regex.hasMatch(value!)) ? emptyValidationMessage : null;
      // },
      keyboardType: type,
      obscureText: obsecure,
      cursorColor: fLabelTextColor,
      controller: _controller,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: Color(0xFF797a7a)),
          labelStyle: const TextStyle(color: Color(0xff83b7b8)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.sp),
            borderSide: const BorderSide(color: Color(0xff83b7b8)),
            gapPadding: 10.sp,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.sp),
            borderSide: const BorderSide(color: Color(0xff83b7b8)),
            gapPadding: 10,
          )));
}

Widget showtimepickerwidget(
    TextEditingController? _controller,
    String hintText,
    //final VoidCallback,
    String labelText,
    bool obsecure,
    TextInputType type,
    BuildContext context
    //String? emptyValidationMessage,
    //final validator,
    ) {
  return GestureDetector(
    onTap: () {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input,
        confirmText: "CONFIRM",
        cancelText: "NOT NOW",
        helpText: "APPOINTMENT TIME",
      );
    },
    child: TextFormField(
        enabled: false,
        autovalidate: true,
        keyboardType: type,
        obscureText: obsecure,
        cursorColor: fLabelTextColor,
        controller: _controller,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            hintStyle: const TextStyle(color: Color(0xFF797a7a)),
            labelStyle: const TextStyle(color: Color(0xff83b7b8)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.sp),
              borderSide: const BorderSide(color: Color(0xff83b7b8)),
              gapPadding: 10.sp,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.sp),
              borderSide: const BorderSide(color: Color(0xff83b7b8)),
              gapPadding: 10,
            ))),
  );
}
