

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  String? selectedAccount;
  String? selectedGender;
  final _ageController = TextEditingController();
  final _problemNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text(
                AppStrings.kSelectAccount,
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s14)),
              ),
            ),
            selectAccount(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text(
                AppStrings.kGender,
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s14)),
              ),
            ),
            gender(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text(
                AppStrings.kAge,
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s14)),
              ),
            ),
            CustomTextFormField(
                hintText: "18 Years",
                controller: _ageController,
                validator: (String? val) {
                      (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Your Age";
                    }
                    return null;
                  };
                }),
            SizedBox(height: AppSize.s15.h),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
              child: Text(
                AppStrings.kWriteYourProblem,
                style: getboldStyle(
                    color: ColorManager.secondary,
                    fontSize: ScreenUtil().setSp(AppSize.s14)),
              ),
            ),
            CustomTextFormField(
                //hintText: AppStrings.kFirstName,
                controller: _problemNameController,
                maxLines: 6,
                validator: (String? val) {
                      (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Your Problem";
                    }
                    return null;
                  };
                }),
            SizedBox(height: AppSize.sizeHeight(context)*0.15),
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
  Widget selectAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 45,
        child: DropdownButtonFormField<String>(
          value: selectedAccount,
          style: TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: ColorManager.kGreyColor,
              ),
            ),
            labelText: AppStrings.kCardiologist,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedAccount = newValue;
            });
          },
          items: [AppStrings.kSharifShaikh, 'Ali khan', 'Usman Shaikh'].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget gender() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 45,
        child: DropdownButtonFormField<String>(
          value: selectedGender,
          style: TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: ColorManager.kGreyColor,
              ),
            ),
            labelText: AppStrings.kCardiologist,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedGender = newValue;
            });
          },
          items: ['Male','Female', 'Others'].map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }


}
