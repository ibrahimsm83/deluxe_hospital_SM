import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../export_dulex.dart';

class AudioCall extends StatelessWidget {
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager.kLightBlueColor,
            ColorManager.secondary,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20.0),
                    child: SvgPicture.asset(
                      ImageAssets.arrowLeftIcon,
                      color: ColorManager.secondary,
                      height: 20,
                      width: 20,
                    ),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            CircleAvatar(
              maxRadius: 80,
              backgroundImage: AssetImage(ImageAssets.demoUser2Image),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Dr Awaiz Shaikh',
                style: getboldStyle(
                    color: ColorManager.kWhiteColor, fontSize: 26)),
            Text(
              'Ringing...',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              //  margin: EdgeInsets.only(bottom: 50),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  userController.userRole.value== UserRole.Patient?SizedBox.shrink():  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 28,
                        backgroundColor: ColorManager.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(ImageAssets.kNotesIcon),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Notes',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 28,
                        backgroundColor: ColorManager.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(ImageAssets.kSpeakerIcon),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Speaker',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CustomRouteNames.kSessionEndScreenRoute,
                          );
                        },
                        child: CircleAvatar(
                          maxRadius: 28,
                          backgroundColor: ColorManager.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset(ImageAssets.kMicIcon),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Mute',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 28,
                        backgroundColor: ColorManager.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(ImageAssets.kCallRedIcon),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Call End',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
