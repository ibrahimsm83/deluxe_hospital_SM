import 'package:deluxe_hospital_sm/widgets/bar_chart_widget.dart';
import 'package:deluxe_hospital_sm/widgets/wallet_payment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class ProfileWalletScreen extends StatefulWidget {
  const ProfileWalletScreen({Key? key}) : super(key: key);

  @override
  State<ProfileWalletScreen> createState() => _ProfileWalletScreenState();
}

class _ProfileWalletScreenState extends State<ProfileWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kWallet,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorManager.kLightBlueColor,
                  ),
                  child: BarChartSample1(),
                ),
              ),
              // const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  AppStrings.kWallet,
                  style: getboldStyle(
                    fontSize: 16,
                    color: ColorManager.kWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: viewRow(
                          title: "Revenue ",
                          subtitle: "1,458",
                          iconPath: ImageAssets.kRevenueIcon),
                    ),
                    Expanded(
                      child: viewRow(
                          title: "Payout",
                          subtitle: "6k",
                          iconPath: ImageAssets.kPayoutIcon),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,bottom: 0.0,top: 15.0),
                child: Text(
                  AppStrings.kWithdraw,
                  style: getboldStyle(
                    fontSize: 16,
                    color: ColorManager.kWhiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                child: Withdraw(),
              ),
        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            child:  Withdraw1()),
              const SizedBox(height: 10.0),
              Text(
                AppStrings.kPayments,
                style: getboldStyle(
                    color: ColorManager.kWhiteColor, fontSize: 16),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: InvestigationsTable1(),
              ),
              const SizedBox(height: 10.0),
              Text(
                AppStrings.kPayouts,
                style: getboldStyle(
                    color: ColorManager.kWhiteColor, fontSize: 16),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: InvestigationsTable1(),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewRow({
    String? title,
    String? subtitle,
    String? iconPath,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorManager.kLightBlueColor,
        ),
        //height: 100,
        //width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SvgPicture.asset(iconPath!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: getsemiboldStyle(
                  fontSize: 16,
                  color: ColorManager.kWhiteColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                subtitle ?? "",
                textAlign: TextAlign.center,
                style: getsemiboldStyle(
                  fontSize: 14,
                  color: ColorManager.kWhiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Withdraw() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available",

                  style: getsemiboldStyle(
                    fontSize: 14,
                    color: ColorManager.kWhiteColor,
                  ),
                ),
                Text(
                  "\$15,500.00",
                  style: getsemiboldStyle(
                    fontSize: 12,
                    color: ColorManager.kGreyColor,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                child: Text(
                  AppStrings.kWithdraw,
                  style: getsemiboldStyle(color: ColorManager.kWhiteColor,fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Withdraw1() {
    return Container(
      width: AppSize.sizeWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorManager.kLightBlueColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Escrow",

              style: getsemiboldStyle(
                fontSize: 14,
                color: ColorManager.kWhiteColor,
              ),
            ),
            Text(
              "\$10,000.00",
              style: getsemiboldStyle(
                fontSize: 12,
                color: ColorManager.kGreyColor,
              ),
            ),
          ],
        ),
        ),
    );
  }


}
