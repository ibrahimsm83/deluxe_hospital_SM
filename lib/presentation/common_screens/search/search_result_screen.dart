

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
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
        userImage: ImageAssets.demoUser2Image), UserCardModel.required(
        name: "Dr. Paula M. Fracasso",
        specialist: 'Cardiologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser2Image), UserCardModel.required(
        name: "Dr. Paula M. Fracasso",
        specialist: 'Cardiologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser2Image), UserCardModel.required(
        name: "Dr. Paula M. Fracasso",
        specialist: 'Cardiologist',
        language: 'New York',
        reviews: 5,
        userImage: ImageAssets.demoUser2Image),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.kSearch,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: searchFiled(),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "69 founds",
            style: getboldStyle(
                color: ColorManager.kWhiteColor,
                fontSize: ScreenUtil().setSp(AppSize.s14)),
          ),
        ),

        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView.builder(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemCount: userCardList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: UserCardWidget(data: userCardList![index]!),
                );
              },
            ),
          ),
        ),
      ],),
    );
  }
  Widget searchFiled() {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: ColorManager.kGreyColor,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.lightBlueAccent,
                ),
                labelText: 'Search a health professional',
                labelStyle: getRegularStyle(
                  color: ColorManager.kGreyColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   CustomRouteNames.kSearchFilterScreenRoute,
              // );
            },
            child: Container(
              padding: EdgeInsets.all(15),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: ColorManager.kLightBlueColor,
                  borderRadius: BorderRadius.circular(12)),
              child: SvgPicture.asset(
                ImageAssets.kFilterIcon,
                // width: 10,
                // height: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

}
