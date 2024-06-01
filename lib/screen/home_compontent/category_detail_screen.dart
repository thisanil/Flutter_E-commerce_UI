import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/constant/image.dart';
import 'package:pravaah_ecommerce/common/widget/custom_appbar.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/product_detail_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  CategoryDetailScreen({super.key});

  @override
  List<String> image = [
    ImageControl.electronics,
    ImageControl.watch,
    ImageControl.mobile,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar:  CustomAppBar(home: false,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              GridView.builder(
                  itemCount: image.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 0.8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                           Get.to(() => DetailPageScreen());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r),
                            side: BorderSide(color: ColorConstants.greyColor)),
                        surfaceTintColor: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 110.h,
                              width: double.maxFinite,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        image[index],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 5.h),
                              child: Column(
                                children: [
                                  Text(
                                    "Analog Watch - For Men PWG1092.370",
                                    style: AppStyle.DarkgreyColor12Text,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\₹10,789",
                                        style: AppStyle.blackColor12Text,
                                      ),
                                      Text("15,000",
                                          style:
                                              AppStyle.blackColor12Text.copyWith(
                                            color: ColorConstants.greyColor,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                ColorConstants.darkGreyColor,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
  
}
