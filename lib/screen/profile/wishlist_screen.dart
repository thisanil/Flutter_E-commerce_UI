import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/widget/noData.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: ColorConstants.lightWhiteColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstants.lightWhiteColor,
        backgroundColor: ColorConstants.lightWhiteColor,
        title: Text(
          "Wishlist Items",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body: const Center(child: NoData()),
    );
  }
}
