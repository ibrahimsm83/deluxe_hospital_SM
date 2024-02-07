import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_dulex.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(AppStrings.kMyAppointment,
            style: getboldStyle(
                color: ColorManager.secondary,
                fontSize: ScreenUtil().setSp(AppSize.s18))),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _controller,
            indicatorColor: ColorManager.secondary,
            labelColor: ColorManager.secondary,
            dividerColor: Colors.transparent,
            unselectedLabelColor: ColorManager.kGreyColor,
            labelStyle: getsemiboldStyle(
                color: ColorManager.secondary, fontSize: 14.sp),
            tabs: const [
              Tab(
                text: AppStrings.kUpcoming,
              ),
              Tab(
                text: AppStrings.kComplete,
              ),
              Tab(
                text: AppStrings.kCancelled,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (context, i) => SizedBox(height: 15.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Visibility(
                              visible: index == 0,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      AppStrings.kToday,
                                      style: getsemiboldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 1.5,
                                        color: ColorManager.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: index == 1,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      "November, 2023",
                                      style: getsemiboldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 1.5,
                                        color: ColorManager.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //SizedBox(height: 10),
                            upComingAppointment(),
                          ],
                        ),
                      );
                    }),

                //Container
                ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (context, i) =>
                        SizedBox(height: 15.0),
                    itemBuilder: (context, index) {
                      // double cw =
                      //     AppSize.sizeWidth(context) / 3.3;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Visibility(
                              visible: index == 0,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      AppStrings.kToday,
                                      style: getsemiboldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 1.5,
                                        color: ColorManager.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: index == 1,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      "November, 2023",
                                      style: getsemiboldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 1.5,
                                        color: ColorManager.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            completedAppointment(),
                          ],
                        ),
                      );
                    }),

                ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (context, i) => SizedBox(height: 15.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Visibility(
                              visible: index == 0,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      AppStrings.kToday,
                                      style: getsemiboldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 1.5,
                                        color: ColorManager.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: index == 1,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      "November, 2023",
                                      style: getsemiboldStyle(
                                          color: ColorManager.secondary),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Container(
                                        height: 1.5,
                                        color: ColorManager.secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //SizedBox(height: 10),
                            upComingAppointment(),
                          ],
                        ),
                      );
                    }),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget upComingAppointment() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: ColorManager.kLightBlueColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  ImageAssets.demoUserImage,
                  height: 60,
                  width: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Julia Thompson",
                      style: getmediumStyle(
                          color: ColorManager.secondary, fontSize: 16)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kHospitalIcon,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 5),
                      Text("Therapist",
                          style: getRegularStyle(
                            color: ColorManager.kWhiteColor,
                          )),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        ImageAssets.kPersonIcon,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "In Person Visit",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kCalendarIcon,
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "02 November, 2023",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset(
                        ImageAssets.kClockIcon,
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "12:30 PM",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset(ImageAssets.kMessageIcon),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.kLightBlueColor,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            // color: ColorManager.kLightBlueColor,
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.kCloseCircleIcon,
                            height: 15,
                            width: 15,
                          ),
                          SizedBox(
                              width: 5), // Adjust spacing between icon and text
                          Text('Cancel Appointment',
                              style: getRegularStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.kWhiteColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(
                        context,
                        CustomRouteNames.kScheduledAppointmentScreenRoute,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.kWhiteColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.kCalendarEditIcon,
                              height: 15,
                              width: 15,
                            ),
                            SizedBox(
                                width: 3), // Adjust spacing between icon and text
                            Text('Reschedule',
                                style: getRegularStyle(
                                    fontSize: 10.sp,
                                    color: ColorManager.kGreenColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget completedAppointment() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: ColorManager.kLightBlueColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  ImageAssets.demoUser1Image,
                  height: 60,
                  width: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Julia Thompson",
                      style: getmediumStyle(
                          color: ColorManager.secondary, fontSize: 16)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kHospitalIcon,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 5),
                      Text("Therapist",
                          style: getRegularStyle(
                            color: ColorManager.kWhiteColor,
                          )),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        ImageAssets.kPersonIcon,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "In Person Visit",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kCalendarIcon,
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "02 November, 2023",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset(
                        ImageAssets.kClockIcon,
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "12:30 PM",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.secondary, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        ImageAssets.kChatBlackIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.secondary, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        ImageAssets.kClockBlackIcon,
                        height: 15,
                        width: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.kLightBlueColor,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            // color: ColorManager.kLightBlueColor,
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: // Adjust spacing between icon and text
                          Center(
                            child: Text('Book again',
                                style: getRegularStyle(
                                    fontSize: 12.sp,
                                    color: ColorManager.kWhiteColor)),
                          ),
                      //   ],
                      // ),
                   // ),
                  ),
                ),),
                SizedBox(width: 10),
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.kCalendarEditIcon,
                            height: 15,
                            width: 15,
                          ),
                          SizedBox(
                              width: 3), // Adjust spacing between icon and text
                          Text('Leave a review',
                              style: getRegularStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.kGreenColor)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.circular(30.0),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: // Adjust spacing between icon and text
                Center(
                  child: Text('View Summery',
                      style: getRegularStyle(
                          fontSize: 12.sp,
                          color: ColorManager.kWhiteColor)),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
