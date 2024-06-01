import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';

class priceDetail extends StatelessWidget {
  final int index;
  final String priceAmt;
  final String discount;
  final String deliveryAmt;
  final String totalAmt;
  final String item;
  void Function() onTap;
  priceDetail(
      {super.key,
      required this.priceAmt,
      required this.discount,
      required this.deliveryAmt,
      required this.totalAmt,
      required this.onTap,
      required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: ColorConstants.whiteColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Price Details",
            style: AppStyle.blackColor14TextBold,
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price ($item item)",
                style: AppStyle.greyBlackColor12Text,
              ),
              Text(
                "\₹$priceAmt",
                style: AppStyle.greyBlackColor12Text,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: AppStyle.greyBlackColor12Text,
              ),
              Text(
                "\- \₹$discount",
                style: AppStyle.greyBlackColor12Text
                    .copyWith(color: ColorConstants.greenColor),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(
                "Delivery Charges",
                style: AppStyle.greyBlackColor12Text,
              ),
              const Spacer(),
              Text(
                "\₹$deliveryAmt",
                style: AppStyle.greyBlackColor12Text.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3,
                    decorationColor: ColorConstants.greyColor,
                    color: ColorConstants.greyColor),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "FREE Delivery",
                style: AppStyle.greyBlackColor12Text
                    .copyWith(color: ColorConstants.greenColor),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: const Color.fromARGB(255, 234, 231, 231),
            thickness: 1,
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: AppStyle.blackColor14TextBold,
              ),
              Text(
                "\₹$totalAmt",
                style: AppStyle.blackColor14TextBold,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: const Color.fromARGB(255, 234, 231, 231),
            thickness: 1,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "You will save \₹$discount on this order",
            style: AppStyle.blackColor14TextBold
                .copyWith(color: ColorConstants.greenColor, fontSize: 12.sp),
          ),
          SizedBox(
            height:index==0?10.h:0.h,
          ),
      index==0?Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\₹$priceAmt",
                    style: AppStyle.greyBlackColor12Text.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 3,
                        decorationColor: ColorConstants.greyColor,
                        color: ColorConstants.greyColor),
                  ),
                  Text(
                    "\₹$totalAmt",
                    style: AppStyle.blackW600text18,
                  ),
                ],
              ),
              CustomButton(
               
                buttonWidth: 200.w,
                onTap: onTap,
                text: "Place Order",
              ),
            ],
          ):SizedBox()
        ],
      ),
    );
  }
}
