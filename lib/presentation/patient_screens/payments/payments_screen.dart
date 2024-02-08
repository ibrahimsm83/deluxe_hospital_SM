import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../export_dulex.dart';

class PaymentsScreen extends StatefulWidget {
  PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int _selectedRadioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kPayments,
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Select the payment method  you want to use",
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor,
                    fontSize: ScreenUtil().setSp(AppSize.s12)),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.kLightBlueColor,
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  ImageAssets.kCashIcon,
                  height: 30,
                  width: 30,
                ),
                title: Text(AppStrings.kCash,
                    style: getsemiboldStyle(
                        color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                trailing:  Radio(
                  value: 1,
                  activeColor: ColorManager.secondary,
                  focusColor: ColorManager.secondary,
                  groupValue: _selectedRadioValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioValue = value!;
                    });
                  },
                ),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.kLightBlueColor,
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  ImageAssets.kCryptoIcon,
                  height: 30,
                  width: 30,
                ),
                title: Text(AppStrings.kCrypto,
                    style: getsemiboldStyle(
                        color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                trailing: Radio(
                  value: 0,
                  activeColor: ColorManager.secondary,
                  focusColor: ColorManager.secondary,
                  groupValue: _selectedRadioValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioValue = value!;
                    });
                  },
                ),
                onTap: () {},
              ),
            ),  const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.kLightBlueColor,
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  ImageAssets.kPayForMeIcon,
                  height: 30,
                  width: 30,
                ),
                title: Text(AppStrings.kPayForMe,
                    style: getsemiboldStyle(
                        color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                trailing: Radio(
                  value: 2,
                  activeColor: ColorManager.secondary,
                  focusColor: ColorManager.secondary,
                  groupValue: _selectedRadioValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioValue = value!;
                    });
                  },
                ),
                onTap: () {},
              ),
            ),  const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.kLightBlueColor,
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  ImageAssets.kGiveMeDiscountIcon,
                  height: 30,
                  width: 30,
                ),
                title: Text(AppStrings.kGiveMeDiscount,
                    style: getsemiboldStyle(
                        color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                trailing: Radio(
                  value: 3,
                  activeColor: ColorManager.secondary,
                  focusColor: ColorManager.secondary,
                  groupValue: _selectedRadioValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadioValue = value!;
                    });
                  },
                ),
                onTap: () {},
              ),
            ),
          ],),
      ),
    );
  }
}
