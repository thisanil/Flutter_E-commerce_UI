
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';

class NotificationSettingScreen extends StatefulWidget {
 const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool _switchValue = true;
  bool _switchSms = true;
  bool _switchEmail = false;
  bool _switchWhatsApp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorConstants.whiteColor,
        title: Text(
          "Notification Preferences",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "In App Notification",
                    style: AppStyle.blackColor14Text.copyWith(fontSize: 15.sp),
                  ),
                  const Spacer(),
                  Text(
                    _switchValue ? "On" : "Off",
                    style: AppStyle.blackColor14Text.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 40.0,
                    padding: 4.0,
                    toggleSize: 15.0,
                    borderRadius: 10.0,
                    activeColor: ColorConstants.greenColor,
                    value: _switchValue,
                    onToggle: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
            const  Divider(
                color:  Color.fromARGB(255, 234, 231, 231),
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("SMS Notification",
                      style:
                          AppStyle.blackColor14Text.copyWith(fontSize: 15.sp)),
                  const Spacer(),
                  Text(
                    _switchSms ? "On" : "Off",
                    style: AppStyle.blackColor14Text.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 40.0,
                    padding: 4.0,
                    toggleSize: 15.0,
                    borderRadius: 10.0,
                    activeColor: ColorConstants.greenColor,
                    value: _switchSms,
                    onToggle: (value) {
                      setState(() {
                        _switchSms = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
             const Divider(
                color:  Color.fromARGB(255, 234, 231, 231),
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("Email Notification",
                      style:
                          AppStyle.blackColor14Text.copyWith(fontSize: 15.sp)),
                  const Spacer(),
                  Text(
                    _switchEmail ? "On" : "Off",
                    style: AppStyle.blackColor14Text.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 40.0,
                    padding: 4.0,
                    toggleSize: 15.0,
                    borderRadius: 10.0,
                    activeColor: ColorConstants.greenColor,
                    value: _switchEmail,
                    onToggle: (value) {
                      setState(() {
                        _switchEmail = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
             const Divider(
                color:  Color.fromARGB(255, 234, 231, 231),
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("WhatsApp Notification",
                      style:
                          AppStyle.blackColor14Text.copyWith(fontSize: 15.sp)),
                  const Spacer(),
                  Text(
                    _switchWhatsApp ? "On" : "Off",
                    style: AppStyle.blackColor14Text.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 40.0,
                    padding: 4.0,
                    toggleSize: 15.0,
                    borderRadius: 10.0,
                    activeColor: ColorConstants.greenColor,
                    value: _switchWhatsApp,
                    onToggle: (value) {
                      setState(() {
                        _switchWhatsApp = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
