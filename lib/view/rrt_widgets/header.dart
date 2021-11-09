import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         
          CircleAvatar(
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.power_settings_new))
        ],
      )
    ]);
  }
}
