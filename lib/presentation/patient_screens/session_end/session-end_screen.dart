import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class SessionEndScreen extends StatelessWidget {
  const SessionEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kSessionEnd,
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
      body: SizedBox(
        width: AppSize.sizeWidth(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.kSessionEndIcon,height: 150,width: 150,),
              Text("The Consultation Session Has Ended",
                  textAlign: TextAlign.center,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 14.sp)),
              divider(),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage(ImageAssets.demoUser1Image,),
          
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  'Dr Awaiz Shaikh',
                  style: getboldStyle(color: ColorManager.kWhiteColor,fontSize: 22)
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Immunologists',
                  style: getRegularStyle(color: ColorManager.secondary,fontSize: 16)
              ), SizedBox(
                height: 10,
              ),
              Text(
                'The Velley Hospital in California, Us',
                  style: getRegularStyle(color: ColorManager.secondary,fontSize: 16)
              ),
              divider(),
              SizedBox(
                height: 10,
              ),
              button(
                  text: AppStrings.kLeaveAReview,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(context, CustomRouteNames.kWriteReviewScreenRoute);
                  }),
          
              button(
                  text: AppStrings.kBackToHome,
                  color: ColorManager.kbtnBgColor,
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
  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Container(
        height: 1,
        color: ColorManager.secondary,
      ),
    );
  }
}
