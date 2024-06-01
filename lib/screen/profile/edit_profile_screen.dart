import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';
import 'package:pravaah_ecommerce/common/widget/common_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: ColorConstants.whiteColor,
          title: Text(
            "Edit Profile",
            style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'First Name',
                fillStutes: false,
                fillColor: ColorConstants.whiteColor,
                maxLines: 1,
                maxLength: 30,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                hintText: 'Last Name',
                fillStutes: false,
                fillColor: ColorConstants.whiteColor,
                maxLines: 1,
                maxLength: 20,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onTap: () {},
                text: "Submit",
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                hintText: 'Mobile Number',
                fillStutes: false,
                fillColor: ColorConstants.whiteColor,
                maxLines: 1,
                maxLength: 12,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                hintText: 'Email ID',
                fillStutes: false,
                fillColor: ColorConstants.whiteColor,
                maxLines: 1,
                maxLength: 30,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onTap: () {},
                text: "Deactivate Account",
              ),
            ],
          ),
        ));
  }
}
