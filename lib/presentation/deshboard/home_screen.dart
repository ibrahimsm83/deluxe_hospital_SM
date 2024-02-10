import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export_dulex.dart';

class ProfessionalCategoryModel {
  ProfessionalCategoryModel({this.title, this.iconPath});

  final String? title;
  final String? iconPath;
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProfessionalCategoryModel> professionalCatList =
      <ProfessionalCategoryModel>[
    ProfessionalCategoryModel(
      title: 'General',
      iconPath: ImageAssets.kGeneralIcon,
    ),
    ProfessionalCategoryModel(
      title: 'Dentist',
      iconPath: ImageAssets.kDentistIcon,
    ),
    ProfessionalCategoryModel(
      title: 'Ophtal..',
      iconPath: ImageAssets.kOphtalIcon,
    ),
    ProfessionalCategoryModel(
      title: 'Nutrition',
      iconPath: ImageAssets.kNutritionIcon,
    ),
    ProfessionalCategoryModel(
      title: 'Neurolo',
      iconPath: ImageAssets.kNeuroloIcon,
    ),
    ProfessionalCategoryModel(
      title: 'Pediatric',
      iconPath: ImageAssets.kPediatricIcon,
    ),
    ProfessionalCategoryModel(
      title: 'Radiolo',
      iconPath: ImageAssets.kRadioloIcon,
    ),
    ProfessionalCategoryModel(
      title: 'More',
      iconPath: ImageAssets.kmoreIcon,
    ),
  ];
  List professionalCategoryRouteList = [
    CustomRouteNames.kOnlineConsultationScreenRoute,
    CustomRouteNames.kPresentingComplaintScreenRoute,
    " CustomRouteNames.kDashboardScreenRoute,",
    " CustomRouteNames.kDashboardScreenRoute,",
    " CustomRouteNames.kDashboardScreenRoute,",
    " CustomRouteNames.kDashboardScreenRoute,",
    " CustomRouteNames.kDashboardScreenRoute,",
  ];
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
        userImage: ImageAssets.demoUser2Image),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                emergencyHelp(),
                const SizedBox(height: 10.0),
                Text(
                  "Pay For Someone",
                  style: getRegularStyle(
                      color: ColorManager.kWhiteColor, fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                someOnePayTextFiled(),
                const SizedBox(height: 20),
                searchFiled(),
                const SizedBox(height: 20),
                Text(
                  "Upcoming Appointment",
                  style:
                      getboldStyle(color: ColorManager.secondary, fontSize: 17),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                upComingAppointment(),
                const SizedBox(height: 20),
                Text(
                  AppStrings.kProfessionalCategory,
                  style:
                      getboldStyle(color: ColorManager.secondary, fontSize: 17),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  padding: EdgeInsets.all(5.0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: professionalCatList.length,
                  itemBuilder: (context, index) {
                    return professionalCategoryGridview(
                        professionalCatList[index], (() {
                      if (index == 0 || index == 1) {
                        Navigator.pushNamed(
                            context, professionalCategoryRouteList[index]);
                      }
                    }));
                  },
                ),
                const SizedBox(height: 10),
                rowText(
                    text1: AppStrings.kYourAbleProfessionals,
                    text2: AppStrings.kSeeAll),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userCardList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          CustomRouteNames.kDoctorProfileScreenRoute,
                        );
                      },
                      child: UserCardWidget(data: userCardList![index]!),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //  Container(
          //   height: 50,
          //             width: 50,
          //      decoration: BoxDecoration(
          //        shape: BoxShape.circle,
          //        border: Border.all(
          //          color: ColorManager.secondary,
          //          width: 2.0, // Set your desired border width
          //        ),
          //      ),
          //      child: FloatingActionButton(
          //        onPressed: () {
          //        },
          //        backgroundColor: ColorManager.secondary.withOpacity(0.5),
          //        child: SvgPicture.asset(
          //          ImageAssets.kSendIcon,
          //        ),
          //        shape: CircleBorder(),
          //      )),
          // const SizedBox(height: 16.0),
          //  Container(
          // height: 50,
          // width: 50,
          //    decoration: BoxDecoration(
          //      shape: BoxShape.circle,
          //      border: Border.all(
          //        color: ColorManager.secondary, // Set your desired border color
          //        width: 2.0, // Set your desired border width
          //      ),
          //    ),
          //    child: FloatingActionButton(
          //      onPressed: () {
          //        // Add your desired action when the button is pressed
          //        // print('Button 2 pressed!');
          //      },
          //      backgroundColor: ColorManager.secondary.withOpacity(0.5),
          //      child: SvgPicture.asset(
          //        ImageAssets.kDoubleChatMessageIcon,
          //      ),
          //      shape: CircleBorder(),
          //    ),
          //  ),
          //  const  SizedBox(height: 16.0), // Adjust the spacing between buttons
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorManager.secondary, // Set your desired border color
                width: 2.0, // Set your desired border width
              ),
            ),
            child: FloatingActionButton(
              onPressed: () {
                // Add your desired action when the button is pressed
                // print('Button 3 pressed!');
              },
              backgroundColor: ColorManager.secondary.withOpacity(0.5),
              child: SvgPicture.asset(
                ImageAssets.kShareIcon,
              ),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget rowText({String? text1, String? text2, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1 ?? "",
            style: getboldStyle(color: ColorManager.secondary, fontSize: 18),
            textAlign: TextAlign.left,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(text2 ?? "", //AppStrings.viewAll,
                style: getmediumStyle(
                    color: ColorManager.secondary, fontSize: AppSize.s12.sp)),
          ),
        ],
      ),
    );
  }

  Widget professionalCategoryGridview(
      ProfessionalCategoryModel data, Function()? onTap) {
    return InkWell(
      onTap: onTap, //() {}, //onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: ColorManager.kLightBlueColor, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(data.iconPath ?? ImageAssets.kmoreIcon),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            width: 60,
            child: Center(
              child: Text(
                data.title ?? "",
                style: getsemiboldStyle(
                    color: ColorManager.kWhiteColor, fontSize: 9.sp
                    //AppSize.s10.mv
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget someOnePayTextFiled() {
    return SizedBox(
      height: 45,
      child: TextField(
        maxLines: 1,
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: ColorManager.kGreyColor,
            ),
          ),
          suffixText: 'Pay',
          suffixStyle: TextStyle(color: ColorManager.secondary, fontSize: 18),
          labelText: 'Type Code',
          labelStyle:
              TextStyle(color: ColorManager.kGreyColor, fontSize: 12.sp),
        ),
      ),
    );
  }

  Widget emergencyHelp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
                child: Image.asset(
              ImageAssets.demoUserImage,
              height: 60,
              width: 60,
            )),
            const SizedBox(width: 12.0),
            Column(
              children: [
                Text(
                  "Good Morning",
                  style: getlightStyle(
                      color: ColorManager.secondary,
                      fontSize: ScreenUtil().setSp(AppSize.s14)),
                ),
                Text(
                  "Awaiz Shaikh",
                  style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s16)),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CustomRouteNames.kHomeNotificationsScreenRoute,
                  );
                },
                child: SvgPicture.asset(ImageAssets.kBellIcon)),
            SizedBox(height: 7.0),
            SvgPicture.asset(ImageAssets.kEmergencyIcon),
          ],
        )
      ],
    );
  }

  Widget searchFiled() {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CustomRouteNames.kSearchResultScreenRoute,
                );
              },
              child: TextField(
                enabled: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: ColorManager.kGreyColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: ColorManager.kGreyColor,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
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
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                CustomRouteNames.kSearchFilterScreenRoute,
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              height: 60,

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

  Widget upComingAppointment() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: ColorManager.kLightBlueColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  ImageAssets.demoUserImage,
                  height: 60,
                  width: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Julia Thompson",
                      style: getmediumStyle(
                          color: ColorManager.secondary, fontSize: 16)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kHospitalIcon,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 5),
                      Text("Therapist",
                          style: getRegularStyle(
                            color: ColorManager.kWhiteColor,
                          )),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        ImageAssets.kPersonIcon,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "In Person Visit",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.kCalendarIcon,
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "02 November, 2023",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                      SizedBox(width: 20),
                      SvgPicture.asset(
                        ImageAssets.kClockIcon,
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "12:30 PM",
                        style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset(ImageAssets.kMessageIcon),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.kLightBlueColor,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            // color: ColorManager.kLightBlueColor,
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.kCloseCircleIcon,
                            height: 15,
                            width: 15,
                          ),
                          SizedBox(
                              width: 5), // Adjust spacing between icon and text
                          Text('Cancel Appointment',
                              style: getRegularStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.kWhiteColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.kCalendarEditIcon,
                            height: 15,
                            width: 15,
                          ),
                          SizedBox(
                              width: 3), // Adjust spacing between icon and text
                          Text('Reschedule',
                              style: getRegularStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.kGreenColor)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
