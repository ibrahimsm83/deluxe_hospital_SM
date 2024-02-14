

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class CreditDetailsScreen extends StatelessWidget {
  const CreditDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kCreditDetails,
          style: getboldStyle(
              color: ColorManager.secondary,
              fontSize: ScreenUtil().setSp(AppSize.s16)),
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
            Row(children: [
              Text(
                AppStrings.kCredit,
                style: getboldStyle(
                    color: ColorManager.kWhiteColor,
                    fontSize: ScreenUtil().setSp(AppSize.s16)),
              ),
              SizedBox(width: 20.0),
              Text(
               "\$2000.00",
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s12)),
              ),
            ],),
            const SizedBox(height: 20.0),
            Text(
              AppStrings.kPaymentHistory,
              style: getboldStyle(
                  color: ColorManager.kWhiteColor, fontSize: 16),
            ),
            const SizedBox(height: 5.0),
            PaymentHistoryTable(),
            const SizedBox(height: 10.0),
              Text(
              AppStrings.kRefundHistory,
              style: getboldStyle(
                  color: ColorManager.kWhiteColor, fontSize: 16),
            ),
            const SizedBox(height: 5.0),
              RefundHistoryTable(),
            const SizedBox(height: 10.0),
              button(
                  text: AppStrings.kNext,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CustomRouteNames.kGiveMeDiscountScreenRoute,
                    );
                  }),
              SizedBox(height: AppSize.s10.h),
        
          ],),
        ),
      ),
    );
  }
}
