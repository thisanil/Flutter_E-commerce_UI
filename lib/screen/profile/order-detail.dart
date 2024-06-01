import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/constant/image.dart';
import 'package:pravaah_ecommerce/common/widget/price_detail.dart';
import 'package:timelines/timelines.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({super.key});

  @override
  List<String> status = [
    "Order Place on 7 May, 2024",
    "Delivered on May 12, 2024"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstants.lightWhiteColor,
        backgroundColor: ColorConstants.lightWhiteColor,
        title: Text(
          "Order Details",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Text(
                "Order can be tracked by +910987654321",
                style: AppStyle.blackColor14Text,
              ),
            ),
            Container(
              height: 5.h,
              width: double.maxFinite,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order-ID - OD45462737328372",
                    style: AppStyle.blackColor12boldText.copyWith(
                        color: ColorConstants.greyColor, fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    color: ColorConstants.greyColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              "Titan Watch For Men",
                              style: AppStyle.blackColor14TextBold
                                  .copyWith(fontSize: 14.sp),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "\₹ 4,700",
                            style: AppStyle.blackDarkColor20text.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 60.h,
                        width: 60.h,
                        decoration: BoxDecoration(
                            color: ColorConstants.greyColor,
                            borderRadius: BorderRadius.circular(5.r),
                            image: const DecorationImage(
                                image: AssetImage(
                                  ImageControl.watch,
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  FixedTimeline.tileBuilder(
                    theme: TimelineThemeData(color: ColorConstants.greenColor),
                    builder: TimelineTileBuilder.connectedFromStyle(
                      contentsAlign: ContentsAlign.basic,
                      contentsBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 5.w),
                        child: Text(
                          status[index],
                          style: AppStyle.blackColor12boldText,
                        ),
                      ),
                      connectorStyleBuilder: (context, index) =>
                          ConnectorStyle.solidLine,
                      indicatorStyleBuilder: (context, index) =>
                          IndicatorStyle.dot,
                      itemCount: 2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 5.h,
              width: double.maxFinite,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping Details",
                    style: AppStyle.blackColor12boldText.copyWith(
                        color: ColorConstants.greyColor, fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    color: ColorConstants.greyColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.home,
                        size: 16.sp,
                        color: ColorConstants.darkGreyColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Pravaah",
                        style: AppStyle.blackColor12boldText
                            .copyWith(color: ColorConstants.darkGreyColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: SizedBox(
                        width: 350.w,
                        child: Text(
                          "Ha-261, Salt Lake City, Sector-3, Salt Lake, Kolkata",
                          style: AppStyle.blackColor12boldText
                              .copyWith(color: ColorConstants.darkGreyColor),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: 5.h,
              width: double.maxFinite,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: priceDetail(
                priceAmt: '5,000',
                discount: '300',
                deliveryAmt: '40',
                totalAmt: '4,700',
                onTap: () {},
                item: '2',
                index: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
