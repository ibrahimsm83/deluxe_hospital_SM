import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../export_dulex.dart';



class UserCardWidget extends StatelessWidget {
  final UserCardModel data;

  const UserCardWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.kLightBlueColor,
      elevation: 0.0,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  ImageAssets.kMessageUserIcon,
                  width: 12,
                  height: 12,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  ImageAssets.kAudioCallIcon,
                  width: 12,
                  height: 12,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  ImageAssets.kVideoCallIcon,
                  width: 12,
                  height: 12,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    data.userImage,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.name,
                        style: getmediumStyle(
                            color: ColorManager.kWhiteColor, fontSize: 14)),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.kHospitalIcon,
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          data.specialist,
                          style: getRegularStyle(
                            color: ColorManager.kWhiteColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          ImageAssets.kLocationIcon,
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          data.language,
                          style: getRegularStyle(
                            color: ColorManager.kWhiteColor,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 10.h),
                    ///Buttons
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 2),
                          RatingBar.builder(
                            itemSize: 15,
                            initialRating: data.reviews.toDouble(),
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: ColorManager.kStarColor,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          Text("115 Reviews",
                              style: getRegularStyle(
                                color: ColorManager.kDarkGreyColor,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
