
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class ManageAppointmentScreen extends StatefulWidget {
  const ManageAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<ManageAppointmentScreen> createState() => _ManageAppointmentScreenState();
}

class _ManageAppointmentScreenState extends State<ManageAppointmentScreen> {
  String? selectedType;
  int selectedid = 0;
  String selectedTitle = '\$USD'; // Initial value
  final _feeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kManageAppointment,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,),
            child: Text(
             AppStrings.kManageAppointmentDec,
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 12.sp)),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            child: Text(
              AppStrings.kAppointmentType,
              style: getboldStyle(
                  color: ColorManager.kWhiteColor,
                  fontSize: ScreenUtil().setSp(AppSize.s14)),
            ),
          ),
          appointType(),
          // const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 12.0,top: 20.0),
            child: Text(
              AppStrings.kConsultationFee,
              style: getboldStyle(
                  color: ColorManager.kWhiteColor,
                  fontSize: ScreenUtil().setSp(AppSize.s14)),
            ),
          ),
          feeField(),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              AppStrings.kAppointmentDuration,
              style: getboldStyle(
                  color: ColorManager.kWhiteColor,
                  fontSize: ScreenUtil().setSp(AppSize.s14)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Categories(),
          ),
            const SizedBox(height: 50.0),
            button(
                text: AppStrings.kContinue,
                color: ColorManager.secondary,
                context: context,
                onTap: () {
                  Navigator.pushNamed(context, CustomRouteNames.kWorkingHourScreenRoute);
                }),
        ],),
      ),
    );
  }
  Widget Categories() {
    return ToggleButtonList(
      selected: selectedid,
      callback: (int index) {
        setState(() {
          selectedid = index;
        });
        //pageController.jumpToPage(index);
      },
      categories:[
        "15 min",
        "30 min",
        "60 min",
        "Custom"
      ],
    );
  }
  Widget feeField(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: SizedBox(
                height: 52,
                child: DropdownButtonFormField<String>(
                  padding: EdgeInsets.zero,
                  iconSize: 14,
                  value: selectedTitle,
                  decoration: InputDecoration(
                    // labelText: 'Select Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTitle = newValue!;
                    });
                  },
                  dropdownColor: Color(0xfff0C1A32),
                  items: ['\$USD', 'ADE'].map((String title) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: title,
                      child: Text(
                        title,
                        style: getRegularStyle(color: ColorManager.kWhiteColor,fontSize: 10.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          Flexible(
            flex: 4,
            child: CustomTextFormField(
                hintText: "321",
                horizontalMergin: 0.0,
                // focusNode: node,
                controller: _feeController,
                validator: (String? val) {
                      (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter First Name";
                    }
                    return null;
                  };
                }
            ),
          ),
        ],
      ),
    );
  }
  Widget appointType() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedType,
          style: const TextStyle(
            color: Colors.white,
          ),
          dropdownColor: ColorManager.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: ColorManager.kGreyColor,
              ),
            ),
            labelText: "New York",
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedType = newValue;
            });
          },
          items: ['Chat', 'Voice Call', 'Video Call'].map((String lang) {
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
