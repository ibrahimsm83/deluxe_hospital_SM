import 'package:deluxe_hospital_sm/export_dulex.dart';
import 'package:flutter/material.dart';


class VideoCall extends StatelessWidget {
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
                    margin: EdgeInsets.only(left: 18.0),
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
                              // Navigator.pop(context);
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
                              Icons.switch_camera,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Camera',
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