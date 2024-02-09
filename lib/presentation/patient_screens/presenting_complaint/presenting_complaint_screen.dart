import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class PresentingComplaintScreen extends StatefulWidget {
  const PresentingComplaintScreen({super.key});

  @override
  State<PresentingComplaintScreen> createState() =>
      _PresentingComplaintScreenState();
}

class _PresentingComplaintScreenState extends State<PresentingComplaintScreen> {
  final _PresentingComplaintController = TextEditingController();
  String? selectedHistory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kPresentingComplaint,
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
            children: [
              SizedBox(height: AppSize.s20.h),
              CustomTextFormField(
                  hintText: AppStrings.kFirstName,
                  controller: _PresentingComplaintController,
                  validator: (String? val) {
                    (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Complaint Name";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s15.h),
              history(),
              SizedBox(height: AppSize.s15.h),
              RowComponent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget history() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 55,
        child: DropdownButtonFormField<String>(
          value: selectedHistory,
          style: TextStyle(
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
            labelText: AppStrings.kCardiologist,
            labelStyle: getRegularStyle(color: ColorManager.kGreyColor),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedHistory = newValue;
            });
          },
          items: [AppStrings.kSharifShaikh, 'Ali khan', 'Usman Shaikh']
              .map((String lang) {
            return DropdownMenuItem<String>(
              value: lang,
              child: Text(lang),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget RowComponent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: InkWell(
              onTap: (){
                //Navigate to prescription
                Navigator.pushNamed(context, CustomRouteNames.kPrescriptionScreenRoute);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: ColorManager.secondary)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Text(
                   AppStrings.kPrescription,
                    style: getRegularStyle(color: ColorManager.secondary),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: ColorManager.secondary)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Text(
                  "Investigation",
                  style: getRegularStyle(color: ColorManager.secondary),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: ColorManager.secondary)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Text(
                  AppStrings.kReferral,
                  style: getRegularStyle(color: ColorManager.secondary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
