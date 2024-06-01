import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/constant/image.dart';
import 'package:pravaah_ecommerce/screen/profile/order-detail.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstants.lightWhiteColor,
        backgroundColor: ColorConstants.lightWhiteColor,
        title: Text(
          "My Orders",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: InkWell(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {
                      Get.to(() => OrderDetail());
                    },
                    child: Container(
                      height: 70.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: ColorConstants.whiteColor,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                    color: ColorConstants.greyColor,
                                    borderRadius: BorderRadius.circular(5.r),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          ImageControl.watch,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivered on May 12, 2024",
                                    style: AppStyle.blackColor12Text,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      "Titan Ceramic Fusion Skeleton Automatic Rich Black Dial Steel & Ceramic Strap Watch For Men",
                                      style: AppStyle.blackColor12boldText
                                          .copyWith(
                                              color:
                                                  ColorConstants.darkGreyColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorConstants.greyColor,
                                weight: 0.6,
                                size: 18.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
