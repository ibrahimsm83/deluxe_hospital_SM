import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../export_dulex.dart';

class SubAccountScreen extends StatefulWidget {
   SubAccountScreen({Key? key}) : super(key: key);

  @override
  State<SubAccountScreen> createState() => _SubAccountScreenState();
}

class _SubAccountScreenState extends State<SubAccountScreen> {
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
          AppStrings.kSubAccount,
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
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 20.0),
        //   child: Text(
        //     "Select the payment method  you want to use",
        //     style: getRegularStyle(
        //         color: ColorManager.kWhiteColor,
        //         fontSize: ScreenUtil().setSp(AppSize.s12)),
        //   ),
        // ),
        const SizedBox(height: 30.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorManager.kLightBlueColor,
          ),
          child: ListTile(
            leading: SvgPicture.asset(
              ImageAssets.kPersonIcon,
              height: 20,
              width: 20,
            ),
            title: Text("Ali Ahmed",
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
              ImageAssets.kMessageUserIcon,
              height: 20,
              width: 20,
            ),
            title: Text(AppStrings.kCreateNew,
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
        ),
      ],),
    ),
    );
  }
}
