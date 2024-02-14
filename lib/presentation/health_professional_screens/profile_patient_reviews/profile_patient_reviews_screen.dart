

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../export_dulex.dart';

class ProfilePatientReviewsScreen extends StatelessWidget {
  ProfilePatientReviewsScreen({Key? key}) : super(key: key);
  List<UserCardModel> userCardList = [
    UserCardModel.required(
        name: "Dr. Julia Thompson",
        specialist: 'Therapist',
        language: 'English - Spanish',
        reviews: 5,
        userImage: ImageAssets.demoUserImage),
    UserCardModel.required(
        name: "Dr. George A. Beller",
        specialist: 'Gastrologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser1Image),
    UserCardModel.required(
        name: "Dr. Paula M. Fracasso",
        specialist: 'Cardiologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser2Image),    UserCardModel.required(
        name: "Dr. Paula M. Fracasso",
        specialist: 'Cardiologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser2Image),    UserCardModel.required(
        name: "Dr. Paula M. Fracasso",
        specialist: 'Cardiologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser2Image),    UserCardModel.required(
        name: "Dr. Paula M. Fracasso",
        specialist: 'Cardiologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser2Image),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
         "Patient reviews",
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
      body:
        ListView.builder(
          shrinkWrap: true,
          itemCount: userCardList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kDoctorProfileScreenRoute,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: UserCardWidget(data: userCardList![index]!),
              ),
            );
          },
        ),
    );
  }
}
