import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../export_dulex.dart';

class OnlineConsultationScreen extends StatelessWidget {
  const OnlineConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kOnlineConsultation,
          style: getboldStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s18)),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cancelAppointment(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Booking Info",
                style: getboldStyle(
                    color: ColorManager.kWhiteColor,
                    fontSize: ScreenUtil().setSp(AppSize.s14)),
              ),
            ),
            listTile(ImageAssets.kLocationIcon, "Lenox Hell Hospital",
                "100 E 77th St, New York, NY 10075,United States"),
            listTile(ImageAssets.kCalendarIcon, "Appointment Date",
                "Monday, November 29 2021"),
            listTile(ImageAssets.kClockIcon, "Time", "09:00 am - 09:30 am"),
            listTile(ImageAssets.kSpeakingLanguageIcon, "Speaking Language",
                "English - Spanish"),
            listTile(ImageAssets.kInfoCircleIcon, "Consult Details",
                "Pain in middle area stomach. Already consume painkiller for past two days and there’s no progress."),
SizedBox(height: 20.0,),
            Row(
              children: [
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.kLightBlueColor,
                        borderRadius: BorderRadius.circular(8.0),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Colors.blueGrey,
                        //     offset: Offset(
                        //       0.0,
                        //       0.0,
                        //     ),
                        //     blurRadius: 3.0,
                        //     spreadRadius: 2.0,
                        //   )
                        // ]

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12.0),
                      child: // Adjust spacing between icon and text
                      Center(
                        child: Text("Reschedule",
                            style: getRegularStyle(
                                fontSize: 12.sp,
                                color: ColorManager.secondary)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  //flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.secondary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12.0),
                      child:
                      // Adjust spacing between icon and text
                      Center(
                        child: Text("Start Consultation",
                            style: getRegularStyle(
                                fontSize: 12.sp,
                                color: ColorManager.kWhiteColor)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listTile(String iconPath, String title, String subtitle) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        height: 30,
        width: 30,
        color: ColorManager.secondary,
      ),
      title: Text(
        title,
        style: getboldStyle(color: ColorManager.secondary, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: getRegularStyle(color: ColorManager.kGreyColor, fontSize: 16),
      ),
    );
  }

  Widget cancelAppointment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorManager.kLightBlueColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CircleAvatar(
                      radius: 24.0,
                      backgroundImage: AssetImage(ImageAssets.demoUserImage),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kristin Watson",
                        style: getboldStyle(
                          color: ColorManager.kWhiteColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "F - 23 yr - 175 cm - 65 kg",
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorManager.secondary),
                      ),
                    ],
                  ),
                ],
              ),
              //const SizedBox(width: 5.0),
              Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: SvgPicture.asset(ImageAssets.kMessageOnlineIcon)),
            ],
          ),
        ),
      ),
    );
  }
}
