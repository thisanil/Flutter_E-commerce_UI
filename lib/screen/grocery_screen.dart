import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';
import 'package:pravaah_ecommerce/common/widget/custom_appbar.dart';
import 'package:pravaah_ecommerce/common/widget/toast_service.dart';
import 'package:pravaah_ecommerce/screen/cart/checkout_screen.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/grocery_category_detail_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../common/constant/color.dart';
import '../common/constant/font_style.dart';
import '../common/constant/image.dart';
import '../common/widget/common_textfield.dart';
import 'botom_bar.dart';
import 'home_compontent/grocery_product_detail_page.dart';
import 'home_compontent/scroll_image.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

class GroceryScreen extends StatefulWidget {
  GroceryScreen({super.key, required this.selectedIndex});

  int? selectedIndex;

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  CarouselController carouselController = CarouselController();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';
  TextEditingController _controller = TextEditingController();
  List<String> catName = [
    "Vegetables",
    "Fruits",
    "Oil",
    "Dry Fruits",
    "Snacks",
    "Offers"
  ];

  List<String> image = [
    ImageControl.vegetable,
    ImageControl.fruit,
    ImageControl.oil,
    ImageControl.dryFruit,
    ImageControl.sancks,
  ];

  List<String> offer = [
    ImageControl.offerImage1,
    ImageControl.offerImage2,
    ImageControl.offerImage3,
  ];

  List<String> topRated = [
    ImageControl.tomato,
    ImageControl.leaf,
    ImageControl.oil,
    ImageControl.dryFruit,
    ImageControl.sancks,
    ImageControl.vegetable,
    ImageControl.fruit,
  ];
  ToastService TS = ToastService();
  @override
  int myCurrentIndex = 0;
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          pauseFor: Duration(seconds: 4),
          onResult: (val) => setState(() {
            _controller.text = val.recognizedWords;
            _isListening = false;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      bottomNavigationBar: Container(
        height: 70,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Get.off(BottomBar(index: 1));
              },
              child: Container(
                  height: 40.h,
                  width: 70.w,
                  padding: EdgeInsets.only(top: 5.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: ColorConstants.greyColor)),
                  child: Center(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 35.h,
                          width: 60.w,
                          child: const Icon(
                            CupertinoIcons.shopping_cart,
                            color: Colors.black54,
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: CircleAvatar(
                            radius: 10.r,
                            backgroundColor: ColorConstants.greenColor,
                            child: Text(
                              "1",
                              style: AppStyle.blackColor12boldText
                                  .copyWith(color: ColorConstants.whiteColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              width: 10.h,
            ),
            Expanded(
              child: CustomButton(
                color: ColorConstants.greenColor,
                onTap: () {
                  Get.to(() => OrderSummery());
                },
                text: "Continue",
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: ColorConstants.lightWhiteColor,
            surfaceTintColor: ColorConstants.whiteColor,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 95.h,
            leadingWidth: double.maxFinite,
            leading: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                        widget.selectedIndex = 1;
                        setState(() {});
                        Get.offAll(() => BottomBar(
                              index: 0,
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 0.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: widget.selectedIndex == 1
                              ? ColorConstants.themeColor
                              : ColorConstants.whiteColor,
                        ),
                        child: Center(
                            child: Text("ProKart",
                                style: AppStyle.blackColor16text.copyWith(
                                    color: widget.selectedIndex == 1
                                        ? ColorConstants.whiteColor
                                        : ColorConstants.blackDarkColor
                                            .withOpacity(0.8)),
                                textAlign: TextAlign.center)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: InkWell(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                        widget.selectedIndex = 2;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: widget.selectedIndex == 2
                              ? ColorConstants.greenColor
                              : ColorConstants.whiteColor,
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageControl.Grocery,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Grocery",
                              style: AppStyle.blackColor16text.copyWith(
                                  color: widget.selectedIndex == 2
                                      ? ColorConstants.whiteColor
                                      : ColorConstants.blackDarkColor
                                          .withOpacity(0.8)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: CustomAppBar(
                  home: true,
                  color: ColorConstants.greenColor,
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            carouselController: carouselController,
                            options: CarouselOptions(
                                autoPlay: true,
                                height: 150,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 500),
                                autoPlayInterval: const Duration(seconds: 8),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                viewportFraction: 1,
                                pageSnapping: false,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    myCurrentIndex = index;
                                    carouselController
                                        .jumpToPage(myCurrentIndex!);
                                  });
                                }),
                            items: const [
                              ScrollImage(
                                image: ImageControl.groceryBanner1,
                                reduis: true,
                              ),
                              ScrollImage(
                                image: ImageControl.groceryBanner2,
                                reduis: true,
                              ),
                              ScrollImage(
                                image: ImageControl.groceryBanner3,
                                reduis: true,
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 6.h,
                            right: 145.w,
                            child: AnimatedSmoothIndicator(
                              activeIndex: myCurrentIndex,
                              count: 3,
                              effect: const ScrollingDotsEffect(
                                  dotHeight: 7,
                                  dotWidth: 7,
                                  spacing: 10,
                                  activeDotColor: ColorConstants.greenColor,
                                  paintStyle: PaintingStyle.fill),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shop By Category",
                            style: AppStyle.blackColor14TextBold
                                .copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 70.h,
                            child: ListView.builder(
                                itemCount: image.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: InkWell(
                                      overlayColor:
                                          const MaterialStatePropertyAll(
                                              Colors.transparent),
                                      onTap: () {
                                        Get.to(() =>
                                            GroceryCategoryDetailScreen());
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50.h,
                                            width: 50.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      image[index],
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            catName[index],
                                            style: AppStyle.blackColor12Text,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "New Collection",
                            style: AppStyle.blackColor14TextBold
                                .copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 142.h,
                            child: ListView.builder(
                                itemCount: image.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: InkWell(
                                      overlayColor:
                                          const MaterialStatePropertyAll(
                                              Colors.transparent),
                                      onTap: () {
                                        Get.to(() => GroceryProductDetail());
                                      },
                                      child: Container(
                                        height: 142.h,
                                        width: 100.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.r),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.greyColor)),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 100.h,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        image[index],
                                                      ),
                                                      fit: BoxFit.cover)),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text("Vegetable",
                                                style: AppStyle
                                                    .DarkgreyColor12Text),
                                            Text(
                                              "Under \₹49",
                                              style:
                                                  AppStyle.blackColor12boldText,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Bestseller",
                            style: AppStyle.blackColor14TextBold
                                .copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 141.h,
                            child: ListView.builder(
                                itemCount: topRated.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: InkWell(
                                      overlayColor:
                                          const MaterialStatePropertyAll(
                                              Colors.transparent),
                                      onTap: () {
                                        Get.to(() => GroceryProductDetail());
                                      },
                                      child: Container(
                                        height: 141.h,
                                        width: 100.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.r),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.greyColor)),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 100.h,
                                                  width: 100.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      2.r),
                                                              topRight: Radius
                                                                  .circular(
                                                                      2.r)),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                            topRated[index],
                                                          ),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Positioned(
                                                  top: 5,
                                                  child: Container(
                                                    width: 50.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.h,
                                                            vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.r),
                                                        color: ColorConstants
                                                            .greenColor),
                                                    child: Center(
                                                      child: Text(
                                                        "47% off",
                                                        style: AppStyle
                                                            .whiteColor12text
                                                            .copyWith(
                                                                fontSize:
                                                                    10.sp),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text("Top selling product",
                                                style: AppStyle
                                                    .DarkgreyColor12Text),
                                            Text(
                                              "Under \₹99",
                                              style:
                                                  AppStyle.blackColor12boldText,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          SizedBox(
                            height: 141.h,
                            child: ListView.builder(
                                itemCount: topRated.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: InkWell(
                                      overlayColor:
                                          const MaterialStatePropertyAll(
                                              Colors.transparent),
                                      onTap: () {
                                        Get.to(() => GroceryProductDetail());
                                      },
                                      child: Container(
                                        height: 141.h,
                                        width: 100.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.r),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.greyColor)),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 100.h,
                                                  width: 100.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      2.r),
                                                              topRight: Radius
                                                                  .circular(
                                                                      2.r)),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                            topRated[index],
                                                          ),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Positioned(
                                                  top: 5,
                                                  child: Container(
                                                    width: 50.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.h,
                                                            vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.r),
                                                        color: ColorConstants
                                                            .greenColor),
                                                    child: Center(
                                                      child: Text(
                                                        "35% off",
                                                        style: AppStyle
                                                            .whiteColor12text
                                                            .copyWith(
                                                                fontSize:
                                                                    10.sp),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text("Bestseller",
                                                style: AppStyle
                                                    .DarkgreyColor12Text),
                                            Text(
                                              "Under \₹99",
                                              style:
                                                  AppStyle.blackColor12boldText,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
