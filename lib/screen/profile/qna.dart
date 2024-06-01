import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/widget/noData.dart';



class QuestionandAnsware extends StatefulWidget {
  const QuestionandAnsware({super.key});

  @override
  State<QuestionandAnsware> createState() => _QuestionandAnswareState();
}

class _QuestionandAnswareState extends State<QuestionandAnsware> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
              appBar: AppBar(
        surfaceTintColor: ColorConstants.whiteColor,
        title: Text(
          "My Question & Answers",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
        ),
       
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: [
                TabBar(
                    indicatorColor: ColorConstants.themeColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelStyle: AppStyle.heading16Text.copyWith(fontSize: 14.sp),
                    indicatorWeight: 3,
                    indicator: UnderlineTabIndicator(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5.r),topLeft: Radius.circular(5.r)),
                        borderSide:const BorderSide(color: ColorConstants.themeColor,width: 3.0)
                    ),
                    labelPadding: EdgeInsets.only(bottom: 10.h),
                    labelStyle: AppStyle.heading16Text.copyWith(color: ColorConstants.themeColor,fontSize: 14.sp),
                    tabs: const [
                      Text("Question"),
                      Text("Answers"),
                    ],
          
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                     Column(
                      children: [
                      SizedBox(height: 50.h,),
                       NoData(),
                                  ],
                                ),
                      Column(
                      children: [
                         SizedBox(height: 50.h,),
                         NoData(),
                                  ],
                                ),
                               
                              ],
                            ),
                  ),
            ],
          ),
        ),
      ),
    );
    
  
  }
}
