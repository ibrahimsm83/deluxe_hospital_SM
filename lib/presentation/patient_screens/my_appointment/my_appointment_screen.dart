import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../export_dulex.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kMyAppointment,
          style: getboldStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s17)),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s15.h),
              info(context),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  AppStrings.kScheduledAppointment,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
              ),
              scheduleAppointment(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  AppStrings.kPatientInformation,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
              ),
              patientInfo("Full Name", "Sharif Shaikh", context),
              patientInfo("Gender", "Female", context),
              patientInfo("Age", "18 Years", context),
              patientInfo(
                  "Problem",
                  "it may be better to say “I have had to take 5 days off in the last 6 months due to menstruation” rather than “I've struggled with my periods",
                  context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  AppStrings.kYourPackage,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorManager.kLightBlueColor,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageAssets.kClockIcon,
                    color: ColorManager.secondary,
                    height: 22,
                    width: 22,
                  ),
                  title: Row(
                    children: [
                      Text("${AppStrings.kDuration} ",
                          style: getsemiboldStyle(
                              color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("30 min",
                            style: getRegularStyle(
                                color: ColorManager.secondary, fontSize: 10.sp)),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\$20",
                          style: getsemiboldStyle(
                              color: ColorManager.secondary, fontSize: 10.sp)),
                      Text("(paid)",
                          style: getsemiboldStyle(
                              color: ColorManager.secondary, fontSize: 10.sp)),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorManager.kLightBlueColor,
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageAssets.kMessageUserIcon,
                    height: 20,
                    width: 20,
                  ),
                  title: Text(AppStrings.kChat,
                      style: getsemiboldStyle(
                          color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\$20",
                          style: getsemiboldStyle(
                              color: ColorManager.secondary, fontSize: 10.sp)),
                      Text("(paid)",
                          style: getsemiboldStyle(
                              color: ColorManager.secondary, fontSize: 10.sp)),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 30.0),
              button(
                  text: "Appointment (start at 16:00 PM)",
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(context, CustomRouteNames.kDashboardScreenRoute);
                  }),
        
            ],
          ),
        ),
      ),
    );
  }
  Widget button(
      {Function()? onTap, String? text, Color? color, BuildContext? context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.00, vertical: 8.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getsemiboldStyle(
            color: ColorManager.kWhiteColor,
            fontSize: AppSize.s12.sp,
          ),
          onTap: onTap),
    );
  }
  Widget info(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    ImageAssets.demoUserImage,
                    height: 75,
                    width: 75,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Dr. Julia Thompson",
                            style: getmediumStyle(
                                color: ColorManager.kWhiteColor, fontSize: 16)),
                        //Divider(color: ColorManager.kGreyColor,thickness: 3,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            color: ColorManager.secondary,
                            height: 0.5,
                            width: AppSize.sizeWidth(context)/2,
                          ),
                        ),

                        Text("immunologist | Christ Hospital",
                            style: getRegularStyle(
                                color: ColorManager.kGreyColor, fontSize: 12)),
                        Text(" Christ Hospital, Uk , London",
                            style: getRegularStyle(
                                color: ColorManager.kGreyColor, fontSize: 12)),
                      ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget scheduleAppointment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today, December 22, 2024",
          style: getRegularStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s12)),
        ),
        SizedBox(height: 6.0),
        Text(
          "16:00 - 16:30PM (30 minutes)",
          style: getRegularStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s12)),
        ),
      ],
    );
  }

  Widget patientInfo(String title, String subtitle, BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              // color: Colors.red,
              width: 70,
              child: Text(
                "$title",
                style: getRegularStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s12)),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                ":\t\t",
                style: TextStyle(color: ColorManager.secondary, fontSize: 18),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              //color: Colors.green,
              width: AppSize.sizeWidth(context) - 150,
              child: Text(
                subtitle,
                maxLines: 3,
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor,
                    fontSize: ScreenUtil().setSp(11)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
