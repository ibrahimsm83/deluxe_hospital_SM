

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../export_dulex.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<String> title = [
    "Add Recent Vitals",
    "Edit Profile",
    "Notifications",
    "Credit Details",
    "Languages",
    "Sub account",
    "Pay For Someone",
    "Logout",
  ];

  List<String> iconsList = [
    ImageAssets.kAddRecentIcon,
    ImageAssets.kEditProfileIcon,
    ImageAssets.kNotificationBellIcon,
    ImageAssets.kPaymentsIcon,
    ImageAssets.kLanguageProfileIcon,
    ImageAssets.kSubAccountIcon,
    ImageAssets.kPaymentsIcon,
    ImageAssets.kLogoutIcon,
  ];

  List choicsRoute = [
   " Routes.PrivacyViewRoute,",
    CustomRouteNames.kEditProfileScreenRoute,
    CustomRouteNames.kNotificationsScreenRoute,
    CustomRouteNames.kCreditDetailsScreenRoute,
   " Routes.PrivacyViewRoute,",
    CustomRouteNames.kSubAccountScreenRoute,
    CustomRouteNames.kPayForSomeOneScreenRoute,
   " Routes.PrivacyViewRoute,",

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
        actions: [
          Icon(Icons.more_vert,color: ColorManager.kWhiteColor)
        ],
      ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:65),
              child: Container(
            width: AppSize.sizeWidth(context),
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s30),
                        topRight: Radius.circular(AppSize.s30))),
                // color: Colors.yellow,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 25,right: 25,top: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                    
                    Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorManager.kLightBlueColor,
                            ColorManager.secondary,
                          ],
                        )
                    
                                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                        SvgPicture.asset(ImageAssets.kWalletIcon),
                        Container(height: 50,
                        width: 3, color: Colors.white,
                    
                        ),
                        Text("Credit",style: getRegularStyle(color: ColorManager.kWhiteColor,fontSize: 14.sp),),
                        const SizedBox(width: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text("\$2000.00",style: getsemiboldStyle(color: ColorManager.kWhiteColor),),
                        ),
                      ],
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
                            padding:  EdgeInsets.only(top: index==0?10.0:0.0,),
                            child: customeListTile(
                              title: title[index],
                              leadingIcon:iconsList[index],
                              onTap: () {
                                if(index==1|| index==2||index==3|| index==6||index==5){
                                  Navigator.pushNamed(context, choicsRoute[index]);
                                }
                              },
                            ),
                          ),
                        ),
                       const SizedBox(height: 50),
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
                        radius:50, //profileheight / 2,
                        backgroundColor: Colors.grey.shade800,
                        backgroundImage:AssetImage(ImageAssets.demoUser2Image),
                      ),
              Text("ALi Ahmed",style: getRegularStyle(color: ColorManager.secondary),)
            ],
          ),
        ),
          ],
        )
    );
  }
  Widget customeListTile({String? title, String? leadingIcon, void Function()? onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
            color: ColorManager.kLightBlueColor,
      ),
      child: ListTile(
        leading: SvgPicture.asset(leadingIcon??ImageAssets.kPersonIcon),
        title: Text(title ?? "",
            style: getsemiboldStyle(
                color: ColorManager.kWhiteColor, fontSize: 14.sp)),
        trailing: SvgPicture.asset(ImageAssets.kForwardIcon),
        onTap: onTap,
      ),
    );
  }
}
