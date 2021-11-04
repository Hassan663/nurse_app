import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rtt_nurse_app/controllers/appointment/appointment_controller.dart';
import 'package:rtt_nurse_app/view/ui/homescreen/dashboard_screens/queue.dart';

import 'dashboard_screens/capture_picture.dart';
import 'dashboard_screens/change_password.dart';
import 'dashboard_screens/help.dart';
import 'dashboard_screens/home_dashboard.dart';
import 'dashboard_screens/schedule_appointment.dart';
import 'dashboard_screens/update_account.dart';
import 'dashboard_screens/upload_document.dart';

class HomePage extends StatefulWidget {
  // HomePage({Key? key,}) : super(key: key);

  // final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController page = PageController();
  final appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
                compactSideMenuWidth: width,
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Colors.transparent,
                selectedColor: Color(0xffEDF1F4),
                selectedTitleTextStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                unselectedTitleTextStyle: TextStyle(fontSize: 15),
                selectedIconColor: Colors.redAccent,
                backgroundColor: Colors.white,
                iconSize: 15
                // openSideMenuWidth: 100
                ),
            title: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Image.asset(
                    'assets/rtt.png',
                    height: 100,
                    width: 250,
                  ),
                ),
              ],
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Home',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: Icons.home,
              ),
              SideMenuItem(
                priority: 1,
                title: 'Queue',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: Icons.queue,
              ),
              SideMenuItem(
                priority: 2,
                title: 'Schedule Avalability',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: Icons.schedule,
              ),
              SideMenuItem(
                priority: 3,
                title: 'Update Account',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: Icons.system_update_alt,
              ),
              SideMenuItem(
                priority: 4,
                title: 'Capture a Picture',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: Icons.camera_alt_outlined,
              ),
              SideMenuItem(
                priority: 5,
                title: 'Change Password',
                onTap: () {
                  page.jumpToPage(5);
                },
                icon: Icons.change_circle,
              ),
              SideMenuItem(
                priority: 6,
                title: 'Upload Document',
                onTap: () async {
                  page.jumpToPage(6);
                },
                icon: Icons.cloud_upload_outlined,
              ),
              SideMenuItem(
                priority: 7,
                title: 'Help',
                onTap: () async {
                  page.jumpToPage(7);
                },
                icon: Icons.help_outline,
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                HomeDashboard(),
                Queue(),
                SetAvailability(),
                UpdateAccount(),
                CapturePicture(),
                ChangePassword(),
                UploadDocument(),
                Help()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
