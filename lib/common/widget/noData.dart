import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/font_style.dart';
import '../constant/image.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageControl.noData,height: 100.h,),
        SizedBox(height: 10.h,),
        Text("No Data",style: AppStyle.headingText,)
      ],
    );
  }
}
