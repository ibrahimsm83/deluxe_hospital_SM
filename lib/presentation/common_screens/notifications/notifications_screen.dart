

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class NotificationsScreen extends StatefulWidget {
   NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isSwitched0 = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: Column(children: [
        ListTile(
          title: Text(AppStrings.kGeneralNotifications,style: getboldStyle(fontSize: 14.sp,color: ColorManager.kWhiteColor),),
       trailing:Transform.scale(
         scale: 0.7,
         child: Switch(
           activeColor: ColorManager.secondary,
           inactiveThumbColor: ColorManager.secondary,
           inactiveTrackColor: ColorManager.primary,

           value: isSwitched0,
           onChanged: (value) {
             // Do something with the new value
             setState(() {
               isSwitched0 = value;
             });
           },
         ),
       ),
        ), ListTile(
          title: Text(AppStrings.kSound,style: getboldStyle(fontSize: 14.sp,color: ColorManager.kWhiteColor),),
       trailing:Transform.scale(
         scale: 0.7,
         child: Switch(
           activeColor: ColorManager.secondary,
           inactiveThumbColor: ColorManager.secondary,
           inactiveTrackColor: ColorManager.primary,

           value: isSwitched1,
           onChanged: (value) {
             // Do something with the new value
             setState(() {
               isSwitched1 = value;
             });
           },
         ),
       ),
        ), ListTile(
          title: Text(AppStrings.kNewServiceAvailable,style: getboldStyle(fontSize: 14.sp,color: ColorManager.kWhiteColor),),
       trailing:Transform.scale(
         scale: 0.7,
         child: Switch(
           activeColor: ColorManager.secondary,
           inactiveThumbColor: ColorManager.secondary,
           inactiveTrackColor: ColorManager.primary,

           value: isSwitched2,
           onChanged: (value) {
             // Do something with the new value
             setState(() {
               isSwitched2 = value;
             });
           },
         ),
       ),
        ), ListTile(
          title: Text(AppStrings.kAppUpdates,style: getboldStyle(fontSize: 14.sp,color: ColorManager.kWhiteColor),),
       trailing:Transform.scale(
         scale: 0.7,
         child: Switch(
           activeColor: ColorManager.secondary,
           inactiveThumbColor: ColorManager.secondary,
           inactiveTrackColor: ColorManager.primary,

           value: isSwitched3,
           onChanged: (value) {
             // Do something with the new value
             setState(() {
               isSwitched3 = value;
             });
           },
         ),
       ),
        ), ListTile(
          title: Text(AppStrings.kPayments,style: getboldStyle(fontSize: 14.sp,color: ColorManager.kWhiteColor),),
       trailing:Transform.scale(
         scale: 0.7,
         child: Switch(
           activeColor: ColorManager.secondary,
           inactiveThumbColor: ColorManager.secondary,
           inactiveTrackColor: ColorManager.primary,

           value: isSwitched4,
           onChanged: (value) {
             // Do something with the new value
             setState(() {
               isSwitched4 = value;
             });
           },
         ),
       ),
        ),
      ],),
    );
  }
}
