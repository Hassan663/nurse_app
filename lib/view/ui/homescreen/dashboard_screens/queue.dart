import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtt_nurse_app/constants/rrt_sizes.dart';
import 'package:rtt_nurse_app/utils/rrt_colors.dart';
import 'package:rtt_nurse_app/utils/rtt_textstyle.dart';
import 'package:rtt_nurse_app/view/rrt_widgets/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Queue extends StatefulWidget {
  const Queue({Key? key}) : super(key: key);

  @override
  _QueueState createState() => _QueueState();
}

class _QueueState extends State<Queue>with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
              color: Color(0xffEDF1F4),
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(circular_radius_homeContainers),
                  bottomLeft: Radius.circular(circular_radius_homeContainers))),
          child: Padding(
              padding: EdgeInsets.all(35.0.sp),
              child: Column(children: [
                Header(),
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Text(
                        'Queue',
                        maxLines: 1,
                        style: TextStyle(
                            color: Color(0xff5FA4A4),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Color(0xff5FA4A4),
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text('See all',
                          style: TextStyle(color: Color(0xff5FA4A4))),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Time Slot (12:30 am - 2:30 pm",
                        style: RedText,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: height * 0.40,
                      width: width * 0.95,
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              bottomRight: Radius.circular(
                                  circular_radius_homeContainers),
                              topRight: Radius.circular(
                                  circular_radius_homeContainers),
                              topLeft: Radius.circular(
                                  circular_radius_homeContainers),
                              bottomLeft: Radius.circular(
                                  circular_radius_homeContainers))),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Container(
                                  //height: 200.h,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                      color: fLabelTextColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20,
                                                  top: 20,
                                                  bottom: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    maxRadius: 30,
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon:
                                                            Icon(Icons.person)),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15.w),
                                                    child: Container(
                                                      width: 140,
                                                      child: Text(
                                                        "Patient:",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        softWrap: true,
                                                        maxLines: 1,
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 17.sp,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 10.w,
                                                right: 10.w,
                                              ),
                                              height: 60.h,
                                              decoration: BoxDecoration(
                                                  color: fContainerColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                      height: 25.h,
                                                      width: 25.w,
                                                      child: Image.asset(
                                                          "assets/datetime.png")),
                                                  Container(
                                                    width: 150,
                                                    child: Text(
                                                      "Fri, May 23, 10:00 am - 11:00 am",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.inter(
                                                          fontSize: 15.sp,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 30.h),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Accept",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 15.sp,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                          fixedSize:
                                                              Size(110, 30),
                                                          primary: fButtonColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)))),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Cancel",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 15.sp,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                          fixedSize:
                                                              Size(110, 30),
                                                          primary: fButtonColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)))),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])),
                            );
                          }),
                    ),
                  ],
                )
              ]))),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}