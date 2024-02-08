import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';

class FinishConsultationScreen extends StatefulWidget {
  const FinishConsultationScreen({Key? key}) : super(key: key);

  @override
  State<FinishConsultationScreen> createState() =>
      _FinishConsultationScreenState();
}

class _FinishConsultationScreenState extends State<FinishConsultationScreen> {
  int selectedId = 1;
  int selectedId1 = 0;
  static List tabs = [
    AppStrings.kAbout,
    AppStrings.kChat,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userListTile(),
              const SizedBox(height: 10.0),
              tabsView(),
              const SizedBox(height: 10.0),
              component1(
                  ImageAssets.kVideoCallIcon,
                  AppStrings.kNatureOfConsult,
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
              const SizedBox(height: 10.0),
              component1(
                  ImageAssets.kInfoCircleIcon,
                  AppStrings.kRochelleBackground,
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
              ageGender(),
              const SizedBox(height: 10.0),
              addVitalText(),
              MostRecentVitals(),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(AppStrings.kPreviousClinicalNotes,
                    style:
                    getboldStyle(color: ColorManager.secondary, fontSize: 18.sp)),
              ),
              PreviousClinicalNotes(),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  AppStrings.kInvestigationsList,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 16),
                ),
              ),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: InvestigationsTable(),
              ),
                const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,vertical: 10.0
            ),
            child: Container(
              height: 0.5,
              color: ColorManager.secondary,
            ),
          ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: rowText(
                    text1: "Notes:", text2: "Add notes"),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: bottomComponents(),
              ),
              //Buttons
              const SizedBox(height: 10.0),
              button(
                  text: AppStrings.kFinishConsultation,
                  color: ColorManager.secondary,
                  context: context,
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   CustomRouteNames.kPayForSomeOneTwoScreenRoute,
                    // );
                  }),
            ],
          ),
        ),
      ),
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
            style: getboldStyle(color: ColorManager.kWhiteColor, fontSize: 18),
            textAlign: TextAlign.left,
          ),
          Row(
            children: [
              SvgPicture.asset(ImageAssets.kAddRecentIcon),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: onTap,
                child: Text(text2 ?? "", //AppStrings.viewAll,
                    style: getmediumStyle(
                        color: ColorManager.secondary,
                        fontSize: AppSize.s12.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomComponents(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //width: 300,
        decoration: BoxDecoration(
            color: ColorManager.kLightBlueColor,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Today, 07:00 pm",
                          style: getsemiboldStyle(
                              color: ColorManager.secondary, fontSize: 11.sp)),
                      Text("Lorem Ipsum",
                          style: getboldStyle(
                              color: ColorManager.kWhiteColor, fontSize: 14.sp)),
                    ],
                  ),
                Row(children: [
                  SvgPicture.asset(ImageAssets.kEditGreenIcon,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SvgPicture.asset(ImageAssets.kDeleteIcon,),
                  ),
                ],)
                ],
              ),

              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. View More...",
                  style: getRegularStyle(
                      color: ColorManager.kWhiteColor, fontSize: 12.sp)),
            ],
          ),
        ),
      ),
    );
}
  Widget addVitalText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          SvgPicture.asset(ImageAssets.kAddRecentIcon),
          const SizedBox(width: 10.0),
          Text("Add Vitals",
              style:
                  getboldStyle(color: ColorManager.secondary, fontSize: 14.sp)),
        ],
      ),
    );
  }

  Widget PreviousClinicalNotes() {
    return SizedBox(
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: ColorManager.kLightBlueColor,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Today, 07:00 pm",
                            style: getsemiboldStyle(
                                color: ColorManager.secondary, fontSize: 11.sp)),
                        Text("Lorem Ipsum",
                            style: getboldStyle(
                                color: ColorManager.kWhiteColor, fontSize: 14.sp)),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. View More...",
                            style: getRegularStyle(
                                color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                        Column(
                          children: [
                            SvgPicture.asset(
                              ImageAssets.kDoubleCommentsIcon,
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(height: 5.0),
                            Text("12",
                                style: getsemiboldStyle(
                                    color: ColorManager.kWhiteColor, fontSize: 12.sp)),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget MostRecentVitals() {
    return SizedBox(
        height: 260,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.kRecentImage),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }));
  }

  Widget ageGender() {
    return Padding(
      padding: const EdgeInsets.only(left: 60, top: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Age: \t\t\t\t",
                  style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 14)),
              SizedBox(width: 30.0),
              Text("18 years",
                  style: getsemiboldStyle(
                      color: ColorManager.secondary, fontSize: 14)),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text("Gender:",
                  style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 14)),
              SizedBox(width: 30.0),
              Text("Male",
                  style: getsemiboldStyle(
                      color: ColorManager.secondary, fontSize: 14)),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text("Weight:",
                  style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 14)),
              SizedBox(width: 30.0),
              Text("152 Kg",
                  style: getsemiboldStyle(
                      color: ColorManager.secondary, fontSize: 14)),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text("Height:",
                  style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 14)),
              SizedBox(width: 30.0),
              Text("143.CM",
                  style: getsemiboldStyle(
                      color: ColorManager.secondary, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget userListTile() {
    return ListTile(
      leading: ClipOval(
        child: Image.asset(
          ImageAssets.demoUser2Image,
          height: 40,
          width: 40,
        ),
      ),
      title: Text("Kristin Watson",
          style: getsemiboldStyle(
              color: ColorManager.kWhiteColor, fontSize: 12.sp)),
      subtitle: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.kGreenColor,
              ),
            ),
          ),
          Text("Online",
              style: getsemiboldStyle(
                  color: ColorManager.kGreenColor, fontSize: 12.sp)),
        ],
      ),
      trailing: Icon(Icons.more_vert, color: ColorManager.secondary),
      onTap: () {

         Navigator.of(context).pop();
      },
    );
  }

  Widget component1(String iconPath, String title, String dec) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
              ),
              SizedBox(width: 20),
              Text(title,
                  style: getboldStyle(
                      color: ColorManager.kWhiteColor, fontSize: 13.sp)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 5),
            child: Text(dec,
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: 11.sp)),
          ),
        ],
      ),
    );
  }

  Widget tabsView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedId = 1;
                  selectedId1 = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: selectedId == 0
                      ? LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorManager.kLightBlueColor,
                            ColorManager.kLightBlueColor,
                          ],
                        )
                      : LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorManager.secondary,
                            ColorManager.kLightBlueColor,
                          ],
                        ),
                ),
                //color:selectedId==0? ColorManager.kLightBlueColor:ColorManager.secondary),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      AppStrings.kAbout,
                      style: getsemiboldStyle(color: ColorManager.kWhiteColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedId = 0;
                  selectedId1 = 1;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: selectedId1 == 0
                      ? LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorManager.kLightBlueColor,
                            ColorManager.kLightBlueColor,
                          ],
                        )
                      : LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorManager.secondary,
                            ColorManager.kLightBlueColor,
                          ],
                        ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      AppStrings.kChat,
                      style: getsemiboldStyle(color: ColorManager.kWhiteColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
