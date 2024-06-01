import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';
import '../../common/widget/common_button.dart';
import '../botom_bar.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
          child: Column(
            children: [
              Text(
                "Verify with OTP send to +910987654321",
                style: AppStyle.blackDarkColor20text.copyWith(
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Pinput(
                length: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                followingPinTheme: PinTheme(
                    textStyle: AppStyle.gary14Color
                        .copyWith(fontSize: 16.sp, color: Colors.black),
                    width: 60,
                    height: 60,
                    // margin:  EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: ColorConstants.themeColor.withOpacity(0.4),
                            width: 1.5))),
                defaultPinTheme: PinTheme(
                    textStyle: AppStyle.gary14Color
                        .copyWith(fontSize: 16.sp, color: Colors.black),
                    width: 60,
                    height: 60,
                    // margin:  EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: ColorConstants.themeColor.withOpacity(0.9),
                            width: 1.5))),
                focusedPinTheme: PinTheme(
                    textStyle: AppStyle.gary14Color
                        .copyWith(fontSize: 16.sp, color: Colors.black),
                    width: 60,
                    height: 60,
                    // margin:  EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: ColorConstants.themeColor.withOpacity(0.6),
                            width: 1.5))),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onTap: () {
                  Get.offAll(() => const BottomBar(index: 0));
                },
                text: "Continue",
              ),
              SizedBox(
                height: 10.h,
              ),
              Text.rich(TextSpan(
                  text: "Didn't receive it? ",
                  style: AppStyle.black54Color12Text.copyWith(fontSize: 16.sp),
                  children: const [
                    TextSpan(
                      text: 'Retry in ',
                    )
                  ]))
            ],
          ),
        ));
  }
}

