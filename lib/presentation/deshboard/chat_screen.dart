
import 'package:deluxe_hospital_sm/presentation/common_screens/chat_audio_video/chat_inner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../export_dulex.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  static List<String> storiesname = <String>[
    "Dan Brian",
    "Ramon Miles",
    "Riley Gilbert",
    "JNathaniel Ethan",
    "Ramon Miles",
    "Wade Dave",
    "Seth Ivan",
    "Riley Gilbert",
    "Jorge Dan",
    "Brian Roberto",
    "Ramon Miles"
  ];
  static List<String> storiesprofile = <String>[
    ImageAssets.demoUser1Image,
    ImageAssets.demoUser2Image,
    ImageAssets.demoUserImage,
    ImageAssets.demoUser1Image,
    ImageAssets.demoUser2Image,
    ImageAssets.demoUserImage,
    ImageAssets.demoUser1Image,
    ImageAssets.demoUser2Image,
    ImageAssets.demoUserImage,
    ImageAssets.demoUser2Image,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Chat with Health Professional",
            style: getboldStyle(
                color: ColorManager.secondary,
                fontSize: ScreenUtil().setSp(AppSize.s16))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            searchWidget(),
            const SizedBox(height: 10.0),
            Flexible(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: ((context, index) =>
                      SizedBox(
                       height: 10.0,
                      )),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InnerChat(
                                    image: storiesprofile[index],
                                    name: storiesname[index],
                                  )));
                        },
                        child: chatUser(
                            storiesname[index],
                            storiesprofile[index]));
                  }),
            )
          ],
        ),
      ),
    );
  }


  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
      child: Container(
        height: 45,
        child: TextField(
          style: TextStyle(color: ColorManager.kWhiteColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: AppStrings.kSearchMessage,
            prefixIcon: Icon(Icons.search, color: ColorManager.kWhiteColor),
            hintStyle: TextStyle(color: ColorManager.kGreyColor),
            border: const OutlineInputBorder( // won't be used if the state-specific arguments are defined
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ColorManager.kGreyColor, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ColorManager.kGreyColor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: ColorManager.kGreyColor, width: 1.0),
            ),
            errorBorder: const OutlineInputBorder(

              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

          ),
        ),
      ),
    );


  }

  Widget chatUser(String? name, String? img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black45,
           ColorManager.kLightBlueColor,

          ],
        )
        ),
        child:Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4.0),
    child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(img!),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: getboldStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      "Hey, I was wondering if you could…",
                      style: TextStyle(
                          fontSize: 10.sp, color: ColorManager.kGreyColor),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "8:00 AM",
              style: getRegularStyle(
                  fontSize: 10.sp, color: ColorManager.kWhiteColor),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
