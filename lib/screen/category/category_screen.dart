import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/category_detail_screen.dart';
import 'package:pravaah_ecommerce/screen/home_compontent/product_detail_screen.dart';


import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';
import '../../common/constant/image.dart';

class CategoryScreen extends StatelessWidget {

  @override
  List<String>catName=[
    "Fashion",
    "Electronics",
    "International\nBrand",
    "Mobile\nAccessories",
    "Offers"
  ];
  List<String>image=[
    ImageControl.fashion,
    ImageControl.electronics,
    ImageControl.internalBrand,
    ImageControl.mobile,
    ImageControl.offer,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.lightWhiteColor,
        title: Text("All Category",style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),),
      ),
      body:  SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GridView.builder(
                  itemCount:4,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 0.7
        
                  ),
                  itemBuilder: (context,index){
                  return InkWell(
                     overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                            Get.to(()=>CategoryDetailScreen());
                      },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.r),
                        side: BorderSide(color: ColorConstants.greyColor)
                    
                      ),
                      surfaceTintColor: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(top: 3.h,left: 5.w,right: 5.w),
                            child: Text(catName[index],style: AppStyle.blackColor12Text,overflow: TextOverflow.ellipsis,maxLines: 2,),
                          ),
                          SizedBox(height: 3.h,),
                          Container(
                            height:90.h,
                            width: double.maxFinite,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
                                image: DecorationImage(
                                    image:AssetImage(image[index],),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                    
                    
                        ],
                      ),
                    ),
                  );
                  }
                  )
            ],
          ),
        ),
      ),
    );
  }
}
