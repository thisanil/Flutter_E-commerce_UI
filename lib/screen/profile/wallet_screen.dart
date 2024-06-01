import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        surfaceTintColor: ColorConstants.whiteColor,
        title: Text(
          "My Wallet",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              child: Card(
                surfaceTintColor: ColorConstants.darkGreyColor,
                child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                  child: Row(
                    children: [
                       Icon(CupertinoIcons.creditcard,color: ColorConstants.darkGreyColor,size: 25.sp,),      
                       SizedBox(width: 10.h,),   
                       Text("Wallet Balance",style: AppStyle.blackColor14TextBold,),
                       const Spacer(),
                       Text("\₹ 450",style: AppStyle.blackColor14TextBold,),
                                
                    ],
                  ),
                ),
              ),
            )
            ],
        ),
      ),
    );
  }
}
