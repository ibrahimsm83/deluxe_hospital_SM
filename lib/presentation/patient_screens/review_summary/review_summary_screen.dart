

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kReviewSummary,
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
      body: SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(children: [
            info(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: dateHour(),
            ),
            paymentDetails(context),
            SizedBox(height: AppSize.sizeHeight(context)/4),
            button(
                text: AppStrings.kPay,
                color: ColorManager.secondary,
                context: context,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kReviewSummaryScreenRoute,
                  );
                }),
          ],),
        ),
      ),
    );
  }
  Widget info() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
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
Widget dateHour(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(AppStrings.kDateHour,
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 12)),
            Text("Dec 23, 2024 | 10:00 AM",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 12)),
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(AppStrings.kPatients,
                  style: getRegularStyle(
                      color: ColorManager.secondary, fontSize: 12)),
              Text("Sharif Shaikh",
                  style: getRegularStyle(
                      color: ColorManager.kWhiteColor, fontSize: 12)),
            ],),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(AppStrings.kAppointmentType,
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 12)),
            Text("30 Minutes",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 12)),
          ],)
        ],),
      ),

    );
}
Widget paymentDetails(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(AppStrings.kAmount,
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 12)),
            Text("\$20",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 12)),
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(AppStrings.kPaymentMethod,
                  style: getRegularStyle(
                      color: ColorManager.secondary, fontSize: 12)),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageAssets.kCryptoIcon,
                    height: 15,
                    width: 15,
                  ),
                  Text("Crypto",
                      style: getRegularStyle(
                          color: ColorManager.kWhiteColor, fontSize: 12)),
                ],
              ),
            ],),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(AppStrings.kDiscount,
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 12)),
            Text("\$5",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 12)),
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(height: 1,
            width: AppSize.sizeWidth(context),
            color: ColorManager.secondary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(AppStrings.kTotal,
                style: getRegularStyle(
                    color: ColorManager.secondary, fontSize: 12)),
            Text("\$15",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 12)),
          ],)
        ],),
      ),

    );
}

}
