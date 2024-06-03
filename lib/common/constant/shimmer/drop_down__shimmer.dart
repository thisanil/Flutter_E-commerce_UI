import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:shimmer/shimmer.dart';
class DropDownShimmer extends StatefulWidget {
  const DropDownShimmer({Key? key}) : super(key: key);
  @override
  State<DropDownShimmer> createState() => _DropDownShimmerState();
}
class _DropDownShimmerState extends State<DropDownShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:145.h,
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: ColorConstants.themeColor.withOpacity(0.2),
        highlightColor:ColorConstants.greyColor.withOpacity(0.6),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const SizedBox(height: 50),
        )
      ),
    );
  }
}
class ProfileImageShimmer extends StatefulWidget {
  const ProfileImageShimmer({super.key});

  @override
  State<ProfileImageShimmer> createState() => _ProfileImageShimmerState();
}

class _ProfileImageShimmerState extends State<ProfileImageShimmer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: double.infinity,
      child: Shimmer.fromColors(
          baseColor: ColorConstants.themeColor.withOpacity(0.2),
          highlightColor:ColorConstants.greyColor.withOpacity(0.6),
          child: CircleAvatar(
                radius: 50.r,
            backgroundColor: ColorConstants.greyColor.withOpacity(0.3),
          )
      ),
    );
  }
}
