

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class GiveMeDiscountScreen extends StatelessWidget {
   GiveMeDiscountScreen({super.key});
  final _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kPatientDetails,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text(
                AppStrings.kShareAppLink,
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s16)),
              ),
            ),
            CustomTextFormField(
                hintText: "Sharif Shaikh",
                controller: _linkController,
                validator: (String? val) {
                      (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Paste App Link";
                    }
                    return null;
                  };
                }),
            SizedBox(height: AppSize.s15.h),
            listTile(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text(
                AppStrings.kShareTheAppLinkAndGetDiscount,
                style: getsemiboldStyle(
                    color: ColorManager.kWhiteColor,
                    fontSize: ScreenUtil().setSp(AppSize.s13)),
              ),
            ),
            SizedBox(height: AppSize.sizeHeight(context)/4),
            button(
                text: AppStrings.kShare,
                color: ColorManager.secondary,
                context: context,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kPaymentSetupScreenRoute,
                  );
                }),
          ],
        ),
      ),
    );
  }
   Widget listTile() {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
       child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.0),
           color: ColorManager.kLightBlueColor,
         ),
         child: ListTile(
           title: Text("www.invite.deluxehospital.com/",
               style: getsemiboldStyle(
                   color: ColorManager.secondary, fontSize: 12.sp)),
           trailing:Text("Copy",
               style: getsemiboldStyle(
                   color: ColorManager.secondary, fontSize: 12.sp)),
         ),
       ),
     );
   }
}
