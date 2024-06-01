import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/constant/image.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';
import 'package:pravaah_ecommerce/common/widget/price_detail.dart';
import 'package:pravaah_ecommerce/screen/cart/checkout_screen.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/category_detail_screen.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/grocery_product_detail_page.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/product_detail_screen.dart';

import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';
import '../../common/widget/noData.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int selectedIndex = 1;
  int cnt = 1;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstants.lightWhiteColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: ColorConstants.lightWhiteColor,
                surfaceTintColor: ColorConstants.whiteColor,
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 95.h,
                leadingWidth: double.maxFinite,
                title: Text(
                  "My Cart",
                  style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(
                    height: 56,
                    child: TabBar(
                      indicatorColor: ColorConstants.themeColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelStyle: AppStyle.heading16Text,
                      indicatorWeight: 3,
                      indicator: UnderlineTabIndicator(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.r),
                              topLeft: Radius.circular(5.r)),
                          borderSide: const BorderSide(
                              color: ColorConstants.themeColor, width: 3.0)),
                      labelPadding: EdgeInsets.only(bottom: 10.h),
                      labelStyle: AppStyle.heading16Text
                          .copyWith(color: ColorConstants.themeColor),
                      tabs: const [
                        Text("ProKart"),
                        Text("Grocery"),
                      ],
                    ),
                  ),
                ),
                // flexibleSpace: PreferredSize(preferredSize: Size.fromHeight(45.h),
                //   child: CustomTextField(),
                //   ),
              )
            ];
          },
          body: TabBarView(
            children: [
              ProKart(),
              GroceryKart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProKart() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
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
                                  style: AppStyle.blackColor14TextBold.copyWith(
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
                                                color:
                                                    ColorConstants.whiteColor)),
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
              height: 7.h,
            ),
            priceDetail(
              priceAmt: '45,998',
              discount: '4,598',
              deliveryAmt: '40',
              totalAmt: '41,400',
              onTap: () {
                Get.to(() => OrderSummery());
              },
              item: '1', index: 0,
            ),
            SizedBox(
              height: 70.h,
            )
          ],
        ),
      ),
    );
  }

  Widget GroceryKart() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
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
                        Get.to(() => GroceryProductDetail());
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
                                      image: AssetImage(ImageControl.vegetable),
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
                                  style: AppStyle.blackColor14TextBold.copyWith(
                                      color: ColorConstants.greenColor,
                                      letterSpacing: 0,
                                      fontSize: 10.sp),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                SizedBox(
                                  width: 170.w,
                                  child: Text(
                                    "Cabage(100 g - 500 g)",
                                    style: AppStyle.blackColor12boldText
                                        .copyWith(
                                            color:
                                                ColorConstants.darkGreyColor),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text.rich(TextSpan(
                                    text: "\₹45",
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
                                    color: Color.fromARGB(255, 46, 193, 13)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      //overlayColor: MaterialStatePropertyAll(),
                                      onTap: () {
                                        if (count > 1) {
                                          count = count - 1;
                                        }
                                        setState(() {});
                                      },
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        size: 18.sp,
                                        color: Colors.white54,
                                      ),
                                    ),
                                    Text("${count}",
                                        style: AppStyle.blackColor14TextBold
                                            .copyWith(
                                                fontSize: 14.sp,
                                                color:
                                                    ColorConstants.whiteColor)),
                                    InkWell(
                                      onTap: () {
                                        count = count + 1;
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
              height: 7.h,
            ),
            priceDetail(
              priceAmt: '210',
              discount: '30',
              deliveryAmt: '15',
              totalAmt: '180',
              onTap: () {
                Get.to(() => OrderSummery());
              },
              item: '1', index: 0,
            ),
            SizedBox(
              height: 70.h,
            )
          ],
        ),
      ),
    );
  }
}
