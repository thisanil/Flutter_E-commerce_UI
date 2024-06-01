import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/constant/image.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';
import 'package:pravaah_ecommerce/common/widget/price_detail.dart';
import 'package:pravaah_ecommerce/common/widget/toast_service.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/product_detail_screen.dart';
import 'package:pravaah_ecommerce/screen/profile/address_screen.dart';

class OrderSummery extends StatefulWidget {
  OrderSummery({super.key});

  @override
  State<OrderSummery> createState() => _OrderSummeryState();
}

class _OrderSummeryState extends State<OrderSummery> {
  @override
  int? addressIndex;
  ToastService TS = ToastService();

  List<String> address = [
    "136/ 17 Laxmi Bhuvan, Perin Nariman Street,Mumbai",
    "5-d, Thacker Indl Estate, N M Joshi Marg, Lower Parel, Jacob Circle,Mumbai",
    " Heritage Plaza, J P Rd., Opp. Indian Oil Nagar, Andheri (west),Mumbai",
  ];

  int cnt = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstants.lightWhiteColor,
        backgroundColor: ColorConstants.lightWhiteColor,
        title: Text(
          "Order Summary",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: ColorConstants.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deliver To : ",
                          style: AppStyle.darkGreyColor12Text
                              .copyWith(fontSize: 14.sp),
                        ),
                        InkWell(
                          onTap: () {
                            ShowDialog(context);
                          },
                          child: Container(
                            width: 70.w,
                            padding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                    color: ColorConstants.greyColor)),
                            child: Center(
                                child: Text(
                              "Change",
                              style: AppStyle.blackColor14TextBold.copyWith(
                                  color: ColorConstants.themeColor,
                                  fontSize: 12.sp),
                            )),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Pravaah",
                      style: AppStyle.blackColor14TextBold
                          .copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                        width: 300.w,
                        child: Text(
                          "Ha-261, Salt Lake City, Sector-3, Salt Lake, Kolkata",
                          style: AppStyle.blackColor12boldText
                              .copyWith(color: ColorConstants.darkGreyColor),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: InkWell(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        onTap: () {
                          Get.to(() => DetailPageScreen());
                        },
                        child: Container(
                          height: 70.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                    color: ColorConstants.greyColor,
                                    borderRadius: BorderRadius.circular(5.r),
                                    image: const DecorationImage(
                                        image: AssetImage(ImageControl.mobile),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "In Stock",
                                    style: AppStyle.blackColor14TextBold
                                        .copyWith(
                                            color: ColorConstants.greenColor,
                                            letterSpacing: 0,
                                            fontSize: 10.sp),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 170.w,
                                    child: Text(
                                      "OnePlus Nord CE 3 Lite 5G (Pastel Lime, 8GB RAM, 128GB Storage)",
                                      style: AppStyle.blackColor12boldText
                                          .copyWith(
                                              color:
                                                  ColorConstants.darkGreyColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text.rich(TextSpan(
                                      text: "\₹20,700",
                                      style: AppStyle.blackColor14TextBold
                                          .copyWith(fontSize: 12.sp)))
                                ],
                              ),
                              const Spacer(),
                              Container(
                                  width: 80.w,
                                  height: 24.h,
                                  padding: EdgeInsets.only(bottom: 1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: ColorConstants.themeColor),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        //overlayColor: MaterialStatePropertyAll(),
                                        onTap: () {
                                          if (cnt > 1) {
                                            cnt = cnt - 1;
                                          }
                                          setState(() {});
                                        },
                                        child: Icon(
                                          CupertinoIcons.minus,
                                          size: 18.sp,
                                          color: Colors.white54,
                                        ),
                                      ),
                                      Text("${cnt}",
                                          style: AppStyle.blackColor14TextBold
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: ColorConstants
                                                      .whiteColor)),
                                      InkWell(
                                        onTap: () {
                                          cnt = cnt + 1;
                                          setState(() {});
                                        },
                                        child: Icon(CupertinoIcons.add,
                                            size: 18.sp, color: Colors.white54),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 5.h,
              ),
              priceDetail(
                priceAmt: '45,998',
                discount: '4,598',
                deliveryAmt: '40',
                totalAmt: '41,400',
                onTap: () {
                  Get.to(() => OrderSummery());
                },
                item: '2',
                index: 1,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        width: double.maxFinite,
        color: ColorConstants.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\₹45,998",
                  style: AppStyle.greyBlackColor12Text.copyWith(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10.sp,
                      decorationThickness: 3,
                      decorationColor: ColorConstants.greyColor,
                      color: ColorConstants.greyColor),
                ),
                Text(
                  "\₹41,400",
                  style: AppStyle.blackW600text18,
                ),
              ],
            ),
            CustomButton(
              buttonWidth: 200.w,
              onTap: () {
                TS.showError("Payment getway not integrate yet");
              },
              text: "Continue",
            ),
          ],
        ),
      ),
    );
  }

  ShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select Address",
                  style: AppStyle.blackW600text18,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => AddressScreen());
                  },
                  child: Container(
                    width: 50.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        border: Border.all(color: ColorConstants.greyColor)),
                    child: Center(
                        child: Text(
                      "+ New",
                      style: AppStyle.blackColor14TextBold.copyWith(
                          color: ColorConstants.themeColor, fontSize: 12.sp),
                    )),
                  ),
                )
              ],
            ),
            titlePadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 35.h,
                      child: OutlinedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                      side: const BorderSide(
                                          color: ColorConstants.themeColor)))),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: AppStyle.blackColor14TextBold
                                .copyWith(color: ColorConstants.blackColor),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: CustomButton(
                      buttonHeight: 35.h,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      text: "Select",
                    ),
                  ),
                ],
              )
            ],
            content: SizedBox(
              height: 180.h,
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: InkWell(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              onTap: () {
                                addressIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(
                                        color: addressIndex == index
                                            ? ColorConstants.themeColor
                                            : ColorConstants.greyColor)),
                                child: Text(
                                  address[index],
                                  style: AppStyle.blackColor12Text.copyWith(
                                    fontSize: 13.sp,
                                    color: ColorConstants.darkGreyColor,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
