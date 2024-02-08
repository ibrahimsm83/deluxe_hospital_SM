

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class HomeNotificationsScreen extends StatelessWidget {
   HomeNotificationsScreen({super.key});
List<HomeNotificationModel> notificationList=[
  HomeNotificationModel.required(title: AppStrings.kAppointmentCancelled, dateTime: "Today | 15:36 Am", iconPath: ImageAssets.kAppointmentCancelledIcon, description: AppStrings.kNotificaionDes),
  HomeNotificationModel.required(title: AppStrings.kScheduleChanged, dateTime: "Today | 15:36 Am", iconPath: ImageAssets.kScheduleChangedIcon, description: AppStrings.kNotificaionDes),
  HomeNotificationModel.required(title: AppStrings.kAppointmentSuccess, dateTime: "Today | 15:36 Am", iconPath: ImageAssets.kScheduleChangedIcon, description: AppStrings.kNotificaionDes),
  HomeNotificationModel.required(title: AppStrings.kAppointmentCancelled, dateTime: "Today | 15:36 Am", iconPath: ImageAssets.kAppointmentCancelledIcon, description: AppStrings.kNotificaionDes),
  HomeNotificationModel.required(title: AppStrings.kScheduleChanged, dateTime: "Today | 15:36 Am", iconPath: ImageAssets.kScheduleChangedIcon, description: AppStrings.kNotificaionDes),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            AppStrings.kNotifications,
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

        body: ListView.separated(
          separatorBuilder: (context,index)=>Divider(color: ColorManager.kGreyColor),
            itemCount: notificationList.length,
            itemBuilder: (context, index) {
              return  Container(
               padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: SvgPicture.asset(
                        notificationList[index].iconPath,
                        height: 30,
                        width: 30,
                      ),
                      title: Text(  notificationList[index].title,
                          style: getboldStyle(
                              color: ColorManager.secondary, fontSize: 12.sp)),
                      subtitle: Text( notificationList[index].dateTime,
                          style: getRegularStyle(
                              color: ColorManager.kGreyColor, fontSize: 12.sp)),
                      onTap: () {},
                    ),
                    Text( notificationList[index].description,
                        style: getsemiboldStyle(
                            color: ColorManager.kWhiteColor, fontSize: 10.sp)),
                  ],
                ),
              );
            }
        ),
    );
  }
}
