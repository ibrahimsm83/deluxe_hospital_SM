import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../export_dulex.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({Key? key}) : super(key: key);
  List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Dr Awaiz Shaikh",
          style: getboldStyle(
              color: ColorManager.kWhiteColor,
              fontSize: ScreenUtil().setSp(AppSize.s16)),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              info(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                child: reportWidget(),
              ),
              aboutMe(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  AppStrings.kCheckAvailability,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
              ),

              checkAvailablity(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0,top: 10.0),
                child: Text(
                  AppStrings.kConsultationCharges,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
              ),
              consultationChagres(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,bottom: 8.0),
                child: Text(
                  AppStrings.kWorksAt,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location:",
                      style: getRegularStyle(
                          color: ColorManager.kWhiteColor, fontSize: 14)),
                  SizedBox(width: 10.0),
                  Text("\t\t\tStreams Hospital Street A-3, London",
                      style: getRegularStyle(
                          color: ColorManager.secondary, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  AppStrings.kQualification,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Institution:",
                      style: getRegularStyle(
                          color: ColorManager.kWhiteColor, fontSize: 14)),
                  SizedBox(width: 10.0),
                  Text("\t\t\tAbc School",
                      style: getRegularStyle(
                          color: ColorManager.secondary, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Degree:",
                      style: getRegularStyle(
                          color: ColorManager.kWhiteColor, fontSize: 14)),
                  SizedBox(width: 10.0),
                  Text("\t\t\t\t\t\t\t\tAbc School",
                      style: getRegularStyle(
                          color: ColorManager.secondary, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  AppStrings.kSpeaks,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s16)),
                ),
              ),
              Text(
                "Eng - Spanish",
                style: getRegularStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s13)),
              ),

              const SizedBox(height: 20),
              rowText(text1: AppStrings.kReviews, text2: "See All"),
              const SizedBox(height: 10),
              Reviews(),
              Reviews(),
              Reviews(),
              Reviews(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                 AppStrings.kLoadMoreReviews,
                  style: getsemiboldStyle(
                      color: ColorManager.secondary,
                      fontSize: ScreenUtil().setSp(AppSize.s13)),
                ),
              ),

            button(
                text: AppStrings.kBookAppointment,
                color: ColorManager.secondary,
                context: context,
                onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kBookAppointmentScreenRoute,
                   );
                  }),
              const SizedBox(height: 10),
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
          horizontal: AppSize.sizeWidth(context!) * 0.01, vertical: 8.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.kWhiteColor,
            fontSize: AppSize.s14.sp,
          ),
          onTap: onTap),
    );
  }
Widget Reviews(){
    return    ListTile(
      leading:
      ClipOval(child: Image.asset(ImageAssets.demoUserImage)),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sharif shaikh",
              style: getmediumStyle(
                  color: ColorManager.kWhiteColor, fontSize: 12.sp),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.secondary),
                borderRadius: BorderRadius.circular(30.0),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rate_rounded,size: 15,color: ColorManager.kStarColor),
                    Text("5.0",style: getRegularStyle(color: ColorManager.kWhiteColor)),
                  ],),
              ),
            ),
          ],
        ),
      ),
      subtitle: Text(
        "Dr Awaiz Shaikh is very professional in his work and very responsible. i have consulted and my problem is solved,",
        style: getRegularStyle(
            color: ColorManager.kWhiteColor, fontSize: 10.sp),
      ),
      // trailing:
    );
}
  Widget rowText({String? text1, String? text2, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1 ?? "",
            style: getboldStyle(color: ColorManager.secondary, fontSize: 18),
            textAlign: TextAlign.left,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(text2 ?? "", //AppStrings.viewAll,
                style: getboldStyle(
                    color: ColorManager.secondary, fontSize: AppSize.s13.sp)),
          ),
        ],
      ),
    );
  }

  Widget info() {
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
                    height: 60,
                    width: 60,
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
                        Container(
                          color: ColorManager.secondary,
                          height: 1,
                          width: 250,
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

  Widget reportWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleTitle(
          "5000+",
          AppStrings.kPatients,
          ImageAssets.kPatientIcon,
        ),
        circleTitle(
          "10+",
          AppStrings.kYearsExp,
          ImageAssets.kGraphIconIcon,
        ),
        circleTitle(
          "4.9",
          AppStrings.kRatings,
          ImageAssets.kRatingIcon,
        ),
        circleTitle(
          "4,532",
          AppStrings.kReviews,
          ImageAssets.kmoreIcon,
        ),
      ],
    );
  }

  Widget circleTitle(
    String title,
    String subtitle,
    String iconPath,
  ) {
    return InkWell(
      onTap: () {}, //onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: ColorManager.kLightBlueColor, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(iconPath),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            // width: 60,
            child: Center(
              child: Text(
                title ?? "",
                style: getsemiboldStyle(
                    color: ColorManager.kWhiteColor, fontSize: 9.sp
                    //AppSize.s10.mv
                    ),
              ),
            ),
          ),
          Container(
            // width: 60,
            child: Center(
              child: Text(
                subtitle ?? "",
                style: getsemiboldStyle(
                    color: ColorManager.kWhiteColor, fontSize: 9.sp
                    //AppSize.s10.mv
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.kAboutMe,
          style: getboldStyle(
              color: ColorManager.kWhiteColor,
              fontSize: ScreenUtil().setSp(AppSize.s14)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation. view more ",
            textAlign: TextAlign.left,
            style: getRegularStyle(
                color: ColorManager.kWhiteColor,
                fontSize: ScreenUtil().setSp(AppSize.s12)),
          ),
        ),
      ],
    );
  }

  Widget checkAvailablity() {
    return Wrap(
        children: List.generate(
      weekdays.length,
      (index) => Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: ColorManager.secondary),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  weekdays[index],
                  style: getmediumStyle(
                      color: ColorManager.secondary,
                      fontSize: ScreenUtil().setSp(AppSize.s12)),
                ),
                SvgPicture.asset(ImageAssets.kArrowDownIcon,height: 6,width: 6),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget consultationChagres() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ImageAssets.kChatMoreIcon,
              height: 18,
              width: 18,
            ),
            SizedBox(width: 10.0),
            Text("Chat: \t\t\t\t\t\t\t",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 14)),
            SizedBox(width: 3.0),
            Text("\t\t\t\$6.00:",
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 14)),
          ],
        ),
        SizedBox(height: 5.0),
        Row(
          children: [
            SvgPicture.asset(
              ImageAssets.kAudioCallIcon,
            ),
            SizedBox(width: 10.0),
            Text("\t\tVoice Call:",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 14)),
            SizedBox(width: 5.0),
            Text("\t\t\$10.00:",
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 14)),
          ],
        ),
        SizedBox(height: 5.0),
        Row(
          children: [
            SvgPicture.asset(ImageAssets.kVideoCallIcon),
            SizedBox(width: 10.0),
            Text("\tVideo Call:",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 14)),
            SizedBox(width: 5.0),
            Text("\t\t\$20.00:",
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 14)),
          ],
        ),
      ],
    );
  }
}
