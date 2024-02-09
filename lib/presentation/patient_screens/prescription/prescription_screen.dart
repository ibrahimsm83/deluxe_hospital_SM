import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../export_dulex.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kPrescription,
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
              SizedBox(height: AppSize.s20.h),
              CustomTextFormField(
                  hintText: "Write Prescription here",
                 maxLines: 6,
                 // controller: _PresentingComplaintController,
                  validator: (String? val) {
                        (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Enter Complaint Name";
                      }
                      return null;
                    };
                  }),
              SizedBox(height: AppSize.s30.h),
              button(
                  text: AppStrings.kSubmit,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                   // Navigator.pushNamed(context, CustomRouteNames.kWriteReviewScreenRoute);
                  }),
              SizedBox(height: 20.0,),
        
            ],
          ),
        ),
      ),
    );
  }

}
