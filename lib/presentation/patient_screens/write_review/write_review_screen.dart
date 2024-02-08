

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppStrings.kWriteAReview,
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
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              maxRadius: 100,
              backgroundImage: AssetImage(ImageAssets.demoUser1Image,),
        
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                  'How was your experience with Dr Awaiz Shaikh',
                  textAlign: TextAlign.center,
                  style: getboldStyle(color: ColorManager.kWhiteColor,fontSize: 18)
              ),
            ),
            SizedBox(
              height: 10,
            ),
        
            RatingBar.builder(
              itemSize: 30,
              initialRating:3.0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              ignoreGestures: true,
              itemCount: 5,
              unratedColor: ColorManager.kGreyColor,
        
              itemPadding:
              const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: ColorManager.secondary,
              ),
              onRatingUpdate: (rating) {},
            ),
            divider(),
            SizedBox(height: AppSize.s20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Write Your Review",
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s16)),
                ),
              ),
            ),
            SizedBox(height: AppSize.s20.h),
            CustomTextFormField(
                hintText: "Dr Awaiz Shaikh is very friendly and professional doctor i have a great experience with him",
                //focusNode: node,
                maxLines: 5,
                // controller: _lastNameController,
                validator: (String? val) {
        
                      (String? val) {
                    if (val == null || val.isEmpty) {
                      return "Enter Your Review ";
                    }
                    return null;
                  };
                }),
            SizedBox(height: AppSize.s20.h),
            button(
                text: AppStrings.kSubmit,
                color: ColorManager.secondary,
                context: context,
                onTap: () {
               
                }),
        
            button(
                text: AppStrings.kCancel,
                color: ColorManager.kbtnBgColor,
                context: context,
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Container(
        height: 1,
        color: ColorManager.secondary,
      ),
    );
  }
}
