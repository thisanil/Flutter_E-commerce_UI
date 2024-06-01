import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/widget/toast_service.dart';
import 'package:pravaah_ecommerce/screen/cart/checkout_screen.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/scroll_image.dart';

import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';
import '../../common/constant/image.dart';
import '../../common/widget/common_button.dart';
import '../profile/address_screen.dart';

class DetailPageScreen extends StatefulWidget {
  DetailPageScreen({super.key});

  @override
  State<DetailPageScreen> createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  @override
  int myCurrentIndex = 0;
  int? colorIndex;
  int? storageIndex;
  int value1 = 0;
  int? addressIndex;
  bool favSelect = false;
  ToastService TS = ToastService();

  CarouselController carouselController = CarouselController();
  List<String> image = [
    ImageControl.mobile,
  ];
  List<String> featureImage = [
    ImageControl.replacement,
    ImageControl.freeDelivery,
    ImageControl.warranty,
    ImageControl.topBrands,
  ];
  List<String> feature = [
    "7 Day Service center Replacement",
    "Free Delivery",
    "1 Year Warranty",
    "Top Brands",
  ];
  List<String> color = [
    "Aqua Surge",
    "Gray Shimmer",
    "Blue Void",
    "Pastel Lime",
    "Chromatic Gray",
  ];
  List<String> storage = [
    "4+64 GB ",
    "6+128 GB",
    "6+256 GB",
  ];
  List<String> address = [
    "136/ 17 Laxmi Bhuvan, Perin Nariman Street,Mumbai",
    "5-d, Thacker Indl Estate, N M Joshi Marg, Lower Parel, Jacob Circle,Mumbai",
    " Heritage Plaza, J P Rd., Opp. Indian Oil Nagar, Andheri (west),Mumbai",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstants.whiteColor,
        title: Text(
          "New Collection",
          style: AppStyle.blackColor14Text,
        ),
        actions: [
          IconButton(
            onPressed: () {
               if (favSelect) {
                    favSelect = false;
                    TS.showMsg("Item remove from wishlist");
                  } else {
                    TS.showMsg("Item added to wishlist");
                    favSelect = true;
                  }
              setState(() {});
            },
            icon:  favSelect? const Icon(
              CupertinoIcons.heart_fill,color:ColorConstants.favColor
            ):const Icon(CupertinoIcons.heart,),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  image: ImageControl.mobile,
                ),
              ],
            ),
            SizedBox(
              height: 70.h,
              child: ListView.builder(
                  itemCount: image.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
                      child: InkWell(
                        onTap: () {
                          myCurrentIndex = index;
                          setState(() {
                            carouselController.jumpToPage(myCurrentIndex!);
                          });
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.h,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                  color: myCurrentIndex == index
                                      ? ColorConstants.themeColor
                                      : Colors.transparent,
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside),
                              image: DecorationImage(
                                  image: AssetImage(
                                    image[index],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Variant",
                    style:
                        AppStyle.blackColor14TextBold.copyWith(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Divider(
                    color: ColorConstants.greyColor,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: showBottomSheet,
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Color : ",
                              style: AppStyle.darkGreyColor12Text
                                  .copyWith(fontSize: 14.sp),
                              children: [
                                TextSpan(
                                  text: "Blue",
                                  style: AppStyle.blackColor14TextBold
                                      .copyWith(fontSize: 13.sp),
                                )
                              ]),
                        ),
                        const Spacer(),
                        Text(
                          "8 more",
                          style: AppStyle.blackColor14Text.copyWith(
                              fontSize: 13.sp, color: ColorConstants.greyColor),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 13.sp,
                          color: ColorConstants.greyColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Divider(
                    color: ColorConstants.greyColor,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: showBottomSheet,
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "Storage : ",
                              style: AppStyle.darkGreyColor12Text
                                  .copyWith(fontSize: 14.sp),
                              children: [
                                TextSpan(
                                  text: "128 GB",
                                  style: AppStyle.blackColor14TextBold
                                      .copyWith(fontSize: 13.sp),
                                )
                              ]),
                        ),
                        const Spacer(),
                        Text(
                          "2 more",
                          style: AppStyle.blackColor14Text.copyWith(
                              fontSize: 13.sp, color: ColorConstants.greyColor),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 13.sp,
                          color: ColorConstants.greyColor,
                        )
                      ],
                    ),
                  ),
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
                        text: "OnePlus ",
                        style: AppStyle.blackColor14TextBold
                            .copyWith(fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text:
                                "Nord CE 3 Lite 5G (Pastel Lime, 128 GB) (8 GB RAM)",
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
                        "20,700",
                        style: AppStyle.blackDarkColor20text.copyWith(
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "10% off",
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
                          text: "\₹22,999 ",
                          style: AppStyle.blackDarkColor20text.copyWith(
                              fontSize: 12.sp,
                              color: ColorConstants.greyColor,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: ColorConstants.darkGreyColor),
                        )
                      ])),
                  Text("+ 49 Secured Packaging Fee",
                      style: AppStyle.blackColor12boldText
                          .copyWith(fontSize: 13.sp)),
                  Text("Free Delivery", style: AppStyle.blackColor12boldText),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: "Deliver To : ",
                            style: AppStyle.darkGreyColor12Text
                                .copyWith(fontSize: 15.sp),
                            children: [
                              TextSpan(
                                text: "Pravaah",
                                style: AppStyle.blackColor14TextBold
                                    .copyWith(fontSize: 15.sp),
                              )
                            ]),
                      ),
                      SizedBox(
                          width: 250.w,
                          child: Text(
                            "Ha-261, Salt Lake City, Sector-3, Salt Lake, Kolkata",
                            style: AppStyle.blackColor12Text.copyWith(
                              fontSize: 12.sp,
                              color: ColorConstants.greyColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ShowDialog();
                    },
                    child: Container(
                      width: 70.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: ColorConstants.greyColor)),
                      child: Center(
                          child: Text(
                        "Change",
                        style: AppStyle.blackColor14TextBold.copyWith(
                            color: ColorConstants.themeColor, fontSize: 12.sp),
                      )),
                    ),
                  ),
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
              child: SizedBox(
                height: 80.h,
                child: ListView.builder(
                    itemCount: featureImage.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: SizedBox(
                          width: 80.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                featureImage[index],
                                height: 30.h,
                                width: 30.h,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                feature[index],
                                style: AppStyle.blackColor12boldText,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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
                  Text("Highlight",
                      style: AppStyle.blackColor14TextBold
                          .copyWith(fontSize: 15.sp, letterSpacing: 0)),
                  SizedBox(
                    child: HtmlContentViewer(
                      htmlContent:
                          ' <p>Your destination for all things OnePlus Nord CE 3!</p>'
                          '</header>'
                          ' <section>'
                          ' <div class="container">'
                          '<h4>Overview</h4>'
                          '<p>The OnePlus Nord CE 3 is the latest addition to the Nord series, known for its exceptional performance and affordability.</p>'
                          '<h4>Features</h4>'
                          ' <ul>'
                          ' <li>6.7-inch AMOLED display</li>'
                          '<li>Triple rear camera setup</li>'
                          ' <li>Qualcomm Snapdragon processor</li>'
                          '<li>5G connectivity</li>'
                          '<li>Large battery capacity</li>'
                          ' </ul>'
                          ' <h4>Availability</h4>'
                          ' <p>Available for purchase on the OnePlus website and select retailers.</p>'
                          '</div>'
                          '</section>'
                          ' </body>'
                          ' </html>',
                      initialContentHeight: MediaQuery.of(context).size.height,
                      initialContentWidth: MediaQuery.of(context).size.width,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
                    TS.showMsg("Item added to cart");
                  },
                  child: const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: ColorConstants.blackColor,
                  )),
            ),
            SizedBox(
              width: 10.h,
            ),
            SizedBox(
              height: 40.h,
              child: OutlinedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              side: const BorderSide(
                                  color: ColorConstants.themeColor)))),
                  onPressed: () {},
                  child: Text(
                    "Pay With EMI",
                    style: AppStyle.blackColor14TextBold
                        .copyWith(color: ColorConstants.blackColor),
                  )),
            ),
            SizedBox(
              width: 10.h,
            ),
            Expanded(
              child: CustomButton(
                onTap: () {
                  Get.to(()=>OrderSummery());
                },
                text: "Buy Now",
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBottomSheet() {
    Get.bottomSheet(Container(
      height: 300.h,
      width: double.maxFinite,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Select Variant",
                style: AppStyle.blackW600text18,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: ColorConstants.greyColor,
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text("Color",
              style: AppStyle.darkGreyColor12Text.copyWith(fontSize: 16.sp)),
          SizedBox(
            height: 10.h,
          ),
          GridView.builder(
              itemCount: color.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    colorIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: ColorConstants.greyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        color[index],
                        style: AppStyle.darkGreyColor12Text,
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 15.h,
          ),
          Text("Storage",
              style: AppStyle.darkGreyColor12Text.copyWith(fontSize: 16.sp)),
          SizedBox(
            height: 10.h,
          ),
          GridView.builder(
              itemCount: storage.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    storageIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: ColorConstants.greyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        storage[index],
                        style: AppStyle.darkGreyColor12Text,
                      ),
                    ),
                  ),
                );
              }),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: 35.h,
                  child: OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  text: "Apply",
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }

  ShowDialog() {
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
