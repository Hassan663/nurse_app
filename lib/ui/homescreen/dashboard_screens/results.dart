// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rrt_client_web_app/rrt_widgets/header.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rrt_client_web_app/utils/rrt_colors.dart';
// import 'package:rrt_client_web_app/utils/rrt_sizes.dart';
// import 'package:rrt_client_web_app/utils/rtt_textstyle.dart';

// class Results extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       decoration: new BoxDecoration(
//           color: Color(0xffEDF1F4),
//           borderRadius: new BorderRadius.only(
//               topLeft: Radius.circular(circular_radius_homeContainers),
//               bottomLeft: Radius.circular(circular_radius_homeContainers))),
//       child: Padding(
//         padding: EdgeInsets.all(35.0.sp),
//         child: Column(
//           children: [
//             Header(),
//             SizedBox(
//               height: 35.h,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 20.w),
//                   child: Text(
//                     'Results',
//                     maxLines: 1,
//                     style: headerText,
//                   ),
//                 ),
//                 Expanded(
//                     child: Divider(
//                   color: Color(0xff5FA4A4),
//                 )),
//               ],
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               decoration: new BoxDecoration(
//                   color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
//                   borderRadius: new BorderRadius.all(
//                     Radius.circular(5),
//                   )),
//               // color: Colors.white,
//               height: MediaQuery.of(context).size.height * 0.73,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: EdgeInsets.all(12.0.sp),
//                 child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         childAspectRatio: 4.w / 3.h,
//                         crossAxisSpacing: 0.w,
//                         mainAxisSpacing: 0.h),
//                     itemCount: 12,
//                     itemBuilder: (BuildContext ctx, index) {
//                       return Padding(
//                           padding: EdgeInsets.all(28.0.sp),
//                           child: SingleChildScrollView(
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.grey.withOpacity(0.3),
//                                           spreadRadius: 5,
//                                           blurRadius: 5,
//                                           offset: Offset(0,
//                                               3), // changes position of shadow
//                                         ),
//                                       ],
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(15)),
//                                   child: Column(children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               top: 25.h, left: 10.w),
//                                           child: Text(
//                                             "Appointment $index",
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             style: GoogleFonts.inter(
//                                                 fontSize: 20.sp,
//                                                 fontStyle: FontStyle.normal,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: fButtonColor),
//                                           ),
//                                         ),
//                                         // Image.asset("assets/video.png"),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 10.w,
//                                           right: 10.w,
//                                           top: 20.h,
//                                           bottom: 10.h),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Icon(
//                                             Icons.add_circle,
//                                             color: fButtonColor,
//                                           ),
//                                           SizedBox(
//                                             width: 10.w,
//                                           ),
//                                           Text(
//                                             "Positive",
//                                             overflow: TextOverflow.ellipsis,
//                                             style: GoogleFonts.inter(
//                                                 fontSize: 20.sp,
//                                                 fontStyle: FontStyle.normal,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: fButtonColor),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 10.w, right: 10.w, top: 20.h),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 Icon(
//                                                   Icons.schedule,
//                                                   color: fButtonColor,
//                                                   size: 20.sp,
//                                                 ),
//                                                 Text(
//                                                   "10:15 AM",
//                                                   style: TextStyle(
//                                                       fontSize: 16.sp,
//                                                       color: fButtonColor),
//                                                 )
//                                               ]),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               Icon(
//                                                 Icons.event,
//                                                 color: fTextTwoColor,
//                                                 size: 20.sp,
//                                               ),
//                                               Text(
//                                                 "10/14/2021",
//                                                 style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     color: fButtonColor),
//                                               )
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15.h,
//                                     )
//                                   ]))));
//                     }),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
