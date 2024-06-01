import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';
import 'package:pravaah_ecommerce/common/widget/noData.dart';
import 'package:pravaah_ecommerce/screen/profile/add_address_screen.dart';

import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorConstants.whiteColor,
        title: Text(
          "Address",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body:  SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              CustomButton(
                onTap: () {
                  Get.to(()=>NewAddresses());
                },
                text: "\+ Add a new address",
              ),
              SizedBox(height:50.h),
             const NoData()
            ],
          ),
        ),
      ),
    );
  }
}
