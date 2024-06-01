import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/screen/profile/buy_again_screen.dart';
import 'package:pravaah_ecommerce/screen/profile/edit_profile_screen.dart';
import 'package:pravaah_ecommerce/screen/profile/notification_setting_screen.dart';
import 'package:pravaah_ecommerce/screen/profile/orders_screen.dart';
import 'package:pravaah_ecommerce/screen/profile/qna.dart';
import 'package:pravaah_ecommerce/screen/profile/review_screen.dart';
import 'package:pravaah_ecommerce/screen/profile/tnc.dart';
import 'package:pravaah_ecommerce/screen/profile/wallet_screen.dart';
import 'package:pravaah_ecommerce/screen/profile/wishlist_screen.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';
import '../../common/widget/common_button.dart';
import '../../common/widget/noData.dart';
import 'address_screen.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  List<String> item = ["Orders", "Wishlist", "Buy Again", "Help Center"];
  List<IconData> icons = [
    CupertinoIcons.shopping_cart,
    CupertinoIcons.heart,
    CupertinoIcons.arrow_2_circlepath,
    Icons.headset_mic_rounded,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.lightWhiteColor,
        title: Text(
          "Hey, Pravaah",
          style: AppStyle.blackDarkColor20text,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 15.w,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  return OutlinedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    side: const BorderSide(
                                        color: ColorConstants.greyColor)))),
                    onPressed: () {
                      if (index == 3) {
                        ShowDialog(context);
                      } else if (index == 0) {
                        Get.to(() => OrdersScreen());
                      } else if (index == 1) {
                        Get.to(() => WishlistScreen());
                      } else {
                        Get.to(() => BuyAgainScreen());
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          icons[index],
                          color: ColorConstants.themeColor,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          item[index],
                          style: AppStyle.blackColor14TextBold,
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Account Settings",
                style: AppStyle.heading16Text.copyWith(letterSpacing: 0),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.to(() => EditProfile());
                  },
                  child: ProfileMenu("Edit Profile", CupertinoIcons.person)),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.to(() => WalletScreen());
                  },
                  child: ProfileMenu("Wallet",   CupertinoIcons.creditcard)),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.to(() => AddressScreen());
                  },
                  child:
                      ProfileMenu("Save Addresses", CupertinoIcons.placemark)),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.to(() => NotificationSettingScreen());
                  },
                  child: ProfileMenu(
                      "Notification Settings", CupertinoIcons.bell_circle)),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "My Activity",
                style: AppStyle.heading16Text.copyWith(letterSpacing: 0),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.to(() => Myreview());
                  },
                  child: ProfileMenu("Review", CupertinoIcons.bubble_left)),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.to(() => QuestionandAnsware());
                  },
                  child: ProfileMenu("Question & Answers",
                      CupertinoIcons.bubble_left_bubble_right)),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Information",
                style: AppStyle.heading16Text.copyWith(letterSpacing: 0),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.to(() => TPL());
                  },
                  child: ProfileMenu(
                      "Terms & Conditions", CupertinoIcons.doc_on_doc)),
              SizedBox(
                height: 25.h,
              ),
              Align(
                alignment: Alignment.center,
                child: OutlinedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    side: const BorderSide(
                                        color: ColorConstants.themeColor)))),
                    onPressed: () {},
                    child: Text(
                      "Logout",
                      style: AppStyle.blackColor14TextBold
                          .copyWith(color: ColorConstants.themeColor),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ProfileMenu(String name, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorConstants.themeColor,
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          name,
          style: AppStyle.blackColor14Text.copyWith(fontSize: 15.sp),
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: ColorConstants.greyColor,
          weight: 0.6,
          size: 14.sp,
        ),
      ],
    );
  }

  ShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            "Choose Option",
            style: AppStyle.blackW600text18,
          ),
          content: SizedBox(
            height: 60.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () async {
                    launchUrl(Uri.parse('tel:+918504960198'));
                  },
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.phone),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Customer Care",
                        style: AppStyle.headingText.copyWith(
                            color: ColorConstants.blackColor,
                            letterSpacing: 0,
                            fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () async {
                    launchUrl(Uri.parse('mailto:an011saini@gmail.com'));
                  },
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.mail),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Mail Support",
                        style: AppStyle.headingText.copyWith(
                            color: ColorConstants.blackColor,
                            letterSpacing: 0,
                            fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
