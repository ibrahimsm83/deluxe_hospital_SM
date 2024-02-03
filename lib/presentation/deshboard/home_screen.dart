import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_dulex.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              emergencyHelp(),
              const SizedBox(height: 10.0),
              Text(
                "Pay For Someone",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 18),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              someOnePayTextFiled(),
              const SizedBox(height: 20),
              searchFiled(),
              const SizedBox(height: 20),
              Text(
                "Upcoming Appointment",
                style:
                    getboldStyle(color: ColorManager.secondary, fontSize: 18),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              upComingAppointment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget someOnePayTextFiled() {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: ColorManager.kGreyColor,
          ),
        ),
        suffixText: 'Pay',
        suffixStyle: TextStyle(color: ColorManager.secondary, fontSize: 18),
        labelText: 'Type Code',
        labelStyle: TextStyle(
          color: ColorManager.kGreyColor,
        ),
      ),
    );
  }

  Widget emergencyHelp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
                child: Image.asset(
              ImageAssets.demoUserImage,
              height: 80,
              width: 80,
            )),
            const SizedBox(width: 12.0),
            Column(
              children: [
                Text(
                  "Good Morning",
                  style: getlightStyle(
                      color: ColorManager.secondary,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
                Text(
                  "Awaiz Shaikh",
                  style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s16)),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(ImageAssets.kBellIcon),
            SizedBox(height: 10.0),
            SvgPicture.asset(ImageAssets.kEmergencyIcon),
          ],
        )
      ],
    );
  }

  Widget searchFiled() {
    return Row(
      children: [
        Flexible(
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: ColorManager.kGreyColor,
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.lightBlueAccent,
              ),
              labelText: 'Search a health professional',
              labelStyle: getRegularStyle(
                color: ColorManager.kGreyColor,
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        Container(
          padding: EdgeInsets.all(15),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: ColorManager.kLightBlueColor,
              borderRadius: BorderRadius.circular(12)),
          child: SvgPicture.asset(
            ImageAssets.kFilterIcon,
            // width: 10,
            // height: 10,
          ),
        )
      ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
