import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/constant/color.dart';
import '../common/constant/font_style.dart';
import '../common/widget/noData.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.lightWhiteColor,
        title: Text("Notification",style: AppStyle.heading16Text.copyWith(fontSize: 18.sp,letterSpacing: 1),),
      ),
      body: const SingleChildScrollView(
        physics:  ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: NoData())
          ],
        ),
      ),
    );
  }
}
