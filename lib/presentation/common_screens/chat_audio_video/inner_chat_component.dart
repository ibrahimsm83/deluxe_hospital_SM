import 'package:deluxe_hospital_sm/export_dulex.dart';
import 'package:deluxe_hospital_sm/presentation/common_screens/chat_audio_video/audio_call_screen.dart';
import 'package:deluxe_hospital_sm/presentation/common_screens/chat_audio_video/video_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




appBarForChatScreen(BuildContext context,{String? image,String? name}) {
  return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
        decoration: BoxDecoration( color: ColorManager.primary, boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)
        ]),
        height: 56,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(ImageAssets.arrowLeftIcon)),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DashBoard(page:4),
                //   ),
                // );
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 45,
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(
                              left: 0.0, right: 8.0, top: 8.0, bottom: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(image!),
                                fit: BoxFit.cover),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 5,
                          child: CircleAvatar(
                            maxRadius: 4,
                            backgroundColor: Color(0xff51ce6a),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name!,style: getsemiboldStyle(color: ColorManager.secondary),),
                      Text(
                        'online',
                        style: getsemiboldStyle(color: ColorManager.kGreenColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AudioCall()));
                // Navigator.pushNamed(context, 'AudioCall');
              },
              child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: ColorManager.kLightBlueColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    ImageAssets.kAudioCallIcon,

                  )),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>   VideoCall()));
                //Navigator.pushNamed(context, 'VideoCall');
              },
              child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: ColorManager.kLightBlueColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    ImageAssets.kVideoCallIcon,

                  )),
            ),

          ],
        ),
      ));
}

userChatBubble(String message) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            alignment: Alignment.topCenter,
            //  width: 200,
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black45,
                    ColorManager.kLightBlueColor,

                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))),
            child: Center(
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(
                left: 0.0, right: 8.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(ImageAssets.demoUser2Image),
                  fit: BoxFit.cover),
              color: Colors.white,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        '4.15 pm',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      )
    ],
  );
}

otherUserChatBubble(String message,String image) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [

          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.only(
                left: 0.0, right: 8.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover),
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 40,
            //  width: 200,
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ColorManager.secondary,
                    Colors.black12,

                  ],
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))),
            child: Center(
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        '4.15 pm',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      )
    ],
  );
}