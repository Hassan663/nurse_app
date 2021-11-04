import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Nurse!',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text('Have a nice day ahead.'),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none_outlined)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.power_settings_new)),
                ],
              )
            ],
          )
        ],
      )
    ]);
  }
}
