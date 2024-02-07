import 'package:deluxe_hospital_sm/export_dulex.dart';
import 'package:deluxe_hospital_sm/presentation/common_screens/chat_audio_video/inner_chat_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InnerChat extends StatefulWidget {
  final String? image;
  final String? name;

  InnerChat({this.image, this.name});

  @override
  _InnerChatState createState() => _InnerChatState();
}

class _InnerChatState extends State<InnerChat> {
  @override
  void initState() {
    // TODO: implement initState

    print(widget.name);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarForChatScreen(context,
          image: widget.image!, name: widget.name!),
      backgroundColor: ColorManager.primary,
      resizeToAvoidBottomInset: true,
      // appBar: appBarForChatScreen(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    userChatBubble('I just started a new book'),
                    SizedBox(
                      height: 10,
                    ),
                    otherUserChatBubble('Im Good, What\'s up', widget.image!),
                    SizedBox(
                      height: 10,
                    ),
                    userChatBubble('How are you?'),
                    SizedBox(
                      height: 10,
                    ),
                    userChatBubble('Hi There'),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 60,

                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageAssets.kemojiIcon,

                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CustomTextFormField(
                          hintText: AppStrings.kTypeYourTextHere,
                          //controller: _firstNameController,
                        horizontalMergin: 0.0,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              ImageAssets.kAttachIcon,
                            ),
                          ),

                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        ImageAssets.kMicrophoneIcon,
                        //height: 18,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorManager.kLightBlueColor,
                      ),
                      child: SvgPicture.asset(
                        ImageAssets.kSendIcon,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
