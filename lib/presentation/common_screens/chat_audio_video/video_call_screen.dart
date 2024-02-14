import 'package:deluxe_hospital_sm/export_dulex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class VideoCall extends StatelessWidget {
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageAssets.kDoctorImage))),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0,top: 10.0),
                    padding: EdgeInsets.all(9.0),
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                       // color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(fit: BoxFit.fill,
                            image: AssetImage(  ImageAssets.demoUser1Image)
                        )),
                  ),

                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,

                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  color: Colors.transparent,
                  child:  Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}