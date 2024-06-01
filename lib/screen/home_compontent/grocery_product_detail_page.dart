import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/widget/toast_service.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/scroll_image.dart';

import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';
import '../../common/constant/image.dart';
import '../../common/widget/common_button.dart';

class GroceryProductDetail extends StatefulWidget {
  const GroceryProductDetail({super.key});

  @override
  State<GroceryProductDetail> createState() => _GroceryProductDetailState();
}

class _GroceryProductDetailState extends State<GroceryProductDetail> {
  @override
  ToastService TS = ToastService();
  bool favSelect = false;
  CarouselController carouselController = CarouselController();
  int myCurrentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorConstants.whiteColor,
        title: Text(
          "Fruit",
          style: AppStyle.blackColor14Text,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                height: 300,
                initialPage: myCurrentIndex,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                autoPlayInterval: const Duration(milliseconds: 100),
                viewportFraction: 1,
                enableInfiniteScroll: false,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                    carouselController.jumpToPage(myCurrentIndex!);
                  });
                }),
            items: const [
              ScrollImage(
                image: ImageControl.fruit,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70.w,
                  padding: EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: ColorConstants.greenColor.withOpacity(0.2)),
                  child: Center(
                      child: Text(
                    "In Stock",
                    style: AppStyle.blackColor14TextBold.copyWith(
                        color: ColorConstants.greenColor,
                        letterSpacing: 1,
                        fontSize: 12.sp),
                  )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text.rich(
                  TextSpan(
                      text: "Fruit",
                      style: AppStyle.blackColor14TextBold
                          .copyWith(fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: " (500 gm)",
                          style: AppStyle.blackColor12boldText.copyWith(
                            fontSize: 14.sp,
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 5.h,
                ),
                            Row(
                    children: [
                      Text(
                        "\₹",
                        style: AppStyle.blackDarkColor20text.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "46",
                        style: AppStyle.blackDarkColor20text.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "29% off",
                        style: AppStyle.blackColor14TextBold
                            .copyWith(color: ColorConstants.greenColor),
                      ),
                    ],
                  ),
                  Text.rich(TextSpan(
                      text: "M.R.P. : ",
                      style: AppStyle.blackColor12boldText,
                      children: [
                        TextSpan(
                          text: "\₹65 ",
                          style: AppStyle.blackDarkColor20text.copyWith(
                              fontSize: 12.sp,
                              color: ColorConstants.greyColor,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: ColorConstants.darkGreyColor),
                        )
                      ])),
                Text("+ \₹10 Fast Delivery (GST Included)",
                    style: AppStyle.blackColor12boldText
                        .copyWith(fontSize: 13.sp)),
                Text("\₹15 Delivery Fee", style: AppStyle.blackColor12boldText),
              ],
            ),
          ),
          Container(
            height: 5.h,
            width: double.maxFinite,
            color: ColorConstants.lightWhiteColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery in ",
                  style:
                      AppStyle.blackColor12boldText.copyWith(fontSize: 13.sp),
                ),
                Text(
                  "2 Days, Thursday",
                  style: AppStyle.blackColor16text,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "• Schedule Your Delivery",
                  style:
                      AppStyle.blackColor12boldText.copyWith(fontSize: 13.sp),
                ),
                Text(
                  "• Cash On Delivery",
                  style:
                      AppStyle.blackColor12boldText.copyWith(fontSize: 13.sp),
                ),
                Text(
                  "• Easy Doorstep Return",
                  style:
                      AppStyle.blackColor12boldText.copyWith(fontSize: 13.sp),
                ),
              ],
            ),
          ),
          Container(
            height: 5.h,
            width: double.maxFinite,
            color: ColorConstants.lightWhiteColor,
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40.h,
              child: OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            side: const BorderSide(
                                color: ColorConstants.themeColor)))),
                onPressed: () {
                  if (favSelect) {
                    favSelect = false;
                    TS.showMsg("Item remove from wishlist");
                  } else {
                    favSelect = true;
                    TS.showMsg("Item added to wishlist");
                  }

                  setState(() {});
                },
                child: favSelect
                    ? const Icon(CupertinoIcons.heart_fill,
                        color: ColorConstants.favColor)
                    : const Icon(
                        CupertinoIcons.heart,
                        color: Colors.black54,
                      ),
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
            Expanded(
              child: CustomButton(
                color: ColorConstants.greenColor,
                onTap: () {
                  TS.showMsg("Item added to cart");
                },
                text: "Add to Cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
