import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/widget/custom_appbar.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/category_detail_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../common/constant/color.dart';
import '../common/constant/font_style.dart';
import '../common/constant/image.dart';
import '../common/widget/common_textfield.dart';
import 'grocery_screen.dart';
import 'home_compontent/product_detail_screen.dart';
import 'home_compontent/scroll_image.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int selectedIndex = 1;
  int myCurrentIndex = 0;
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';
  TextEditingController _controller = TextEditingController();
  CarouselController carouselController = CarouselController();
  List<String> image = [
    ImageControl.fashion,
    ImageControl.electronics,
    ImageControl.internalBrand,
    ImageControl.mobile,
    ImageControl.offer,
  ];
  List<String> offer = [
    ImageControl.offerImage1,
    ImageControl.offerImage2,
    ImageControl.offerImage3,
  ];
  List<String> topRated = [
    ImageControl.iphone,
    ImageControl.fashion,
    ImageControl.internalBrand,
    ImageControl.electronics,
    ImageControl.mobile,
    ImageControl.watch,
  ];
  List<String> brands = [
    ImageControl.apple,
    ImageControl.onePlus,
    ImageControl.samsung,
    ImageControl.mi,
    ImageControl.apple,
  ];
  List<String> catName = [
    "Fashion",
    "Electronics",
    "International\nBrand",
    "Mobile\nAccessories",
    "Offers"
  ];
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
                        selectedIndex = 1;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 0.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: selectedIndex == 1
                              ? ColorConstants.themeColor
                              : ColorConstants.whiteColor,
                        ),
                        child: Center(
                            child: Text("ProKart",
                                style: AppStyle.blackColor16text.copyWith(
                                    color: selectedIndex == 1
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
                        selectedIndex = 2;
                        setState(() {});
                        Get.offAll(
                            () => GroceryScreen(selectedIndex: selectedIndex));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: selectedIndex == 2
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
                                  color: selectedIndex == 2
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
              child: CustomAppBar(home: true,)
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            carouselController: carouselController,
                            options: CarouselOptions(
                                autoPlay: true,
                                height: 150.h,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 500),
                                autoPlayInterval: const Duration(seconds: 8),
                                // autoPlayCurve: Curves.fastOutSlowIn,
                                viewportFraction: 1,
                                pauseAutoPlayOnTouch: true,
                                // pageSnapping: false,
                                // enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    myCurrentIndex = index;
                                    carouselController
                                        .jumpToPage(myCurrentIndex!);
                                  });
                                }),
                            items: const [
                              ScrollImage(
                                image: ImageControl.Image1,
                              ),
                              ScrollImage(
                                image: ImageControl.Image2,
                              ),
                              ScrollImage(
                                image: ImageControl.Image3,
                              ),
                              ScrollImage(
                                image: ImageControl.Image4,
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 6.h,
                            right: 145.w,
                            child: AnimatedSmoothIndicator(
                              activeIndex: myCurrentIndex,
                              count: 4,
                              effect: const ScrollingDotsEffect(
                                  dotHeight: 7,
                                  dotWidth: 7,
                                  spacing: 10,
                                  activeDotColor: ColorConstants.themeColor,
                                  paintStyle: PaintingStyle.fill),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Categories",
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
                                          Get.to(() => CategoryDetailScreen());
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
                              "Top Brands",
                              style: AppStyle.blackColor14TextBold
                                  .copyWith(fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            GridView.builder(
                                itemCount: brands.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 50.h,
                                    width: 50.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              brands[index],
                                            ),
                                            fit: BoxFit.cover)),
                                  );
                                }),
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
                                          Get.to(() => DetailPageScreen());
                                        },
                                        child: Container(
                                          height: 142.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2.r),
                                              border: Border.all(
                                                  color: ColorConstants
                                                      .greyColor)),
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
                                              Text("New Collection",
                                                  style: AppStyle
                                                      .DarkgreyColor12Text),
                                              Text(
                                                "Under \₹99",
                                                style: AppStyle
                                                    .blackColor12boldText,
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
                              "Top Rated",
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
                                          Get.to(() => DetailPageScreen());
                                        },
                                        child: Container(
                                          height: 141.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2.r),
                                              border: Border.all(
                                                  color: ColorConstants
                                                      .greyColor)),
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
                                                    right: 5,
                                                    top: 5,
                                                    child: Container(
                                                      width: 35.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.h,
                                                              vertical: 1.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.r),
                                                          color: ColorConstants
                                                              .greenColor),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "4.5",
                                                              style: AppStyle
                                                                  .whiteColor12text
                                                                  .copyWith(
                                                                      fontSize:
                                                                          10.sp),
                                                            ),
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  ColorConstants
                                                                      .whiteColor,
                                                              size: 10.sp,
                                                            )
                                                          ],
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
                                                style: AppStyle
                                                    .blackColor12boldText,
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
                                          Get.to(() => DetailPageScreen());
                                        },
                                        child: Container(
                                          height: 141.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2.r),
                                              border: Border.all(
                                                  color: ColorConstants
                                                      .greyColor)),
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
                                                    right: 5,
                                                    top: 5,
                                                    child: Container(
                                                      width: 35.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.h,
                                                              vertical: 1.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.r),
                                                          color: ColorConstants
                                                              .greenColor),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "4.5",
                                                              style: AppStyle
                                                                  .whiteColor12text
                                                                  .copyWith(
                                                                      fontSize:
                                                                          10.sp),
                                                            ),
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  ColorConstants
                                                                      .whiteColor,
                                                              size: 10.sp,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Text("Men WearShoes",
                                                  style: AppStyle
                                                      .DarkgreyColor12Text),
                                              Text(
                                                "Under \₹99",
                                                style: AppStyle
                                                    .blackColor12boldText,
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
                            SizedBox(
                              height: 150.h,
                              child: ListView.builder(
                                  itemCount: offer.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          right: index == 2 ? 0 : 10.w),
                                      child: Container(
                                        height: 150.h,
                                        width: 340.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.r),
                                            border: Border.all(
                                                color:
                                                    ColorConstants.greyColor),
                                            image: DecorationImage(
                                                image: AssetImage(offer[index]),
                                                fit: BoxFit.fill)),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 80.h,
                            )
                          ],
                        ),
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
