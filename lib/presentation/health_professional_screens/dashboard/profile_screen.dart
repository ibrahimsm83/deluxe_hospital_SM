import 'package:deluxe_hospital_sm/widgets/bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../export_dulex.dart';

class ProfileProfessionalHealthCareView extends StatefulWidget {
  const ProfileProfessionalHealthCareView({Key? key}) : super(key: key);

  @override
  State<ProfileProfessionalHealthCareView> createState() =>
      _ProfileProfessionalHealthCareViewState();
}

class _ProfileProfessionalHealthCareViewState
    extends State<ProfileProfessionalHealthCareView> {
  List<String> title = [
    "Medical Profile Details",
    "Patient Reviews",
    "Notifications",
    "Language",
    "Logout",
  ];

  List<String> iconsList = [
    ImageAssets.kProfilePHIcon,
    ImageAssets.kStarPatientReviewIcon,
    ImageAssets.kNotificationBellIcon,
    ImageAssets.kInfoCircleIcon,
    ImageAssets.kLogoutPHIcon,
  ];

  List choicsRoute = [
    CustomRouteNames.kProfileMedicalDetailsScreenRoute,
    CustomRouteNames.kProfilePatientReviewsScreenRoute,
    CustomRouteNames.kNotificationsScreenRoute,
    "CustomRouteNames.kNotificationsScreenRoute,",
    CustomRouteNames.kLoginScreenRoute,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.secondary,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: SizedBox(),
          title: Text(AppStrings.kMyProfile,
              style: getboldStyle(
                  color: ColorManager.kWhiteColor,
                  fontSize: ScreenUtil().setSp(AppSize.s18))),
          actions: [Icon(Icons.more_vert, color: ColorManager.kWhiteColor)],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Container(
                width: AppSize.sizeWidth(context),
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s30),
                        topRight: Radius.circular(AppSize.s30))),
                // color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              CustomRouteNames.kProfileWalletScreenRoute,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    ColorManager.kLightBlueColor,
                                    ColorManager.secondary,
                                  ],
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 2.0),
                                SvgPicture.asset(ImageAssets.kWalletIcon),
                                Container(
                                  height: 50,
                                  width: 3,
                                  color: Colors.white,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Revenue",
                                      style: getRegularStyle(
                                          color: ColorManager.kWhiteColor,
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      "Withdraw",
                                      style: getRegularStyle(
                                          color: ColorManager.kWhiteColor,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10.0),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$2000.00",
                                        style: getsemiboldStyle(
                                            color: ColorManager.kWhiteColor),
                                      ),
                                      Text(
                                        "\$50.00",
                                        style: getsemiboldStyle(
                                            color: ColorManager.kWhiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Settings",
                            style: getboldStyle(
                                color: ColorManager.secondary, fontSize: 16.sp),
                          ),
                        ),
                        ListView.separated(
                          itemCount: title.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 8.0,
                          ),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 10.0 : 0.0,
                            ),
                            child: customeListTile(
                              title: title[index],
                              leadingIcon: iconsList[index],
                              onTap: () {
                                if (index == 0 ||
                                        index == 1 ||
                                        index == 2
                                //||
                                        // index == 4
                                    // ||
                                    // index == 5

                                    ) {
                                  Navigator.pushNamed(
                                      context, choicsRoute[index]);
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50, //profileheight / 2,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: AssetImage(ImageAssets.demoUser2Image),
                  ),
                  Text(
                    "ALi Ahmed",
                    style: getRegularStyle(color: ColorManager.secondary),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget customeListTile(
      {String? title, String? leadingIcon, void Function()? onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: ListTile(
        leading: SvgPicture.asset(leadingIcon ?? ImageAssets.kPersonIcon),
        title: Text(title ?? "",
            style: getsemiboldStyle(
                color: ColorManager.kWhiteColor, fontSize: 14.sp)),
        trailing: SvgPicture.asset(ImageAssets.kForwardIcon),
        onTap: onTap,
      ),
    );
  }
}
