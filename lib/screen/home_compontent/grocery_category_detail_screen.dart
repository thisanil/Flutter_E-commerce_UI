import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/constant/image.dart';
import 'package:pravaah_ecommerce/common/widget/custom_appbar.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/grocery_product_detail_page.dart';

class GroceryCategoryDetailScreen extends StatelessWidget {
  GroceryCategoryDetailScreen({super.key});

  @override
  List<String> image = [
    ImageControl.fruit,
    ImageControl.tomato,
    ImageControl.leaf,
    ImageControl.vegetable
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar:  CustomAppBar(home: true,color: ColorConstants.greenColor,),
      body:  SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                           Get.to(() => GroceryProductDetail());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r),
                            side: BorderSide(color: ColorConstants.greyColor)),
                        surfaceTintColor: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.h,),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fresh fal subji",
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
