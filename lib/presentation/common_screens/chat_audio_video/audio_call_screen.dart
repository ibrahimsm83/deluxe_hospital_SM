import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../export_dulex.dart';





class AudioCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorManager.kLightBlueColor,
                ColorManager.secondary,
              ],
            )
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
              onTap: () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SvgPicture.asset(ImageAssets.arrowLeftIcon,color: ColorManager.secondary,height: 20,width: 20,),
                      )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            CircleAvatar(
              maxRadius: 100,
              backgroundImage: AssetImage(ImageAssets.demoUser2Image),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Dr Awaiz Shaikh',
              style: getboldStyle(color: ColorManager.kWhiteColor,fontSize: 26)
            ),
            SizedBox(
              height: 10,
            ),
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
                  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.mic_off,
                          color: Colors.black,
                          size: 30,
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
                      GestureDetector(
                        onTap: () {

                          Navigator.pushNamed(
                            context,
                            CustomRouteNames.kSessionEndScreenRoute,
                          );
                        },
                        child: CircleAvatar(
                          maxRadius: 35,
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.call_end,
                            color: Colors.black,
                            size: 30,
                          ),
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
                  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.volume_up,
                          color: Colors.black,
                          size: 30,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}