import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';
import 'package:pravaah_ecommerce/common/widget/common_textfield.dart';




class NewAddresses extends StatelessWidget {
   NewAddresses({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      surfaceTintColor: ColorConstants.whiteColor,
      title: Text(
        "Add New Address",
        style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
      ),
    ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: Column(
            children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextField(
                          hintText: 'Full Name*',
                          fillStutes: false,
                          fillColor: ColorConstants.whiteColor,
                          maxLines: 1,
                          maxLength: 50,
                        ),
                 SizedBox(height: 15.h,) ,      
                CustomTextField(
                          hintText:'Mobile Number*',
                          fillStutes: false,
                          fillColor: ColorConstants.whiteColor,
                          maxLines: 1,
                          maxLength: 12,
                          keyboardType: TextInputType.phone,
                        ),
                 SizedBox(height: 15.h,) , 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Expanded(
                          child: CustomTextField(
                          hintText: 'Pincode*',
                          fillStutes: false,
                          fillColor: ColorConstants.whiteColor,
                          maxLines: 1,
                          maxLength: 6,
                          keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(width: 15.w,),
                      SizedBox(
                      height: 40.h,
                      width: 162.w,
                      child:  OutlinedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    side:const BorderSide(color: ColorConstants.themeColor)
                                )
                            )
                        ),
                        onPressed: (){

                        }, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                          Icon(Icons.my_location,color: ColorConstants.greyColor,),
                          Text("My location",style:  GoogleFonts.dmSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color:ColorConstants.greyColor,
                        ),),
                                    ],
                      )
                      ),
                    )       
                    
                  ],
                ),
                  SizedBox(height: 15.h,) , 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Expanded(
                          child: CustomTextField(
                          hintText: 'State*',
                          fillStutes: false,
                          fillColor: ColorConstants.whiteColor,
                          maxLines: 1,
                          maxLength: 20,
                          ),
                        ),
                        SizedBox(width: 15.w,),
                       Expanded(
                          child: CustomTextField(
                          hintText: 'City*',
                          fillStutes: false,
                          fillColor: ColorConstants.whiteColor,
                          maxLines: 1,
                          maxLength: 50,
                          ),
                        ),
                  ]
                      ),
                     SizedBox(height: 15.h,) , 
                      CustomTextField(
                      hintText: 'House no., Building no.*',
                      fillStutes: false,
                      fillColor: ColorConstants.whiteColor,
                      maxLines: 1,
                      maxLength: 50,
                      ),
                      SizedBox(height: 15.h,) , 
                     CustomTextField(
                                     hintText: 'Road name, Area, Colony*',
                                     fillStutes: false,
                                     fillColor: ColorConstants.whiteColor,
                                     maxLines: 1,
                                     maxLength: 100,
                                     ),

                SizedBox(height: 30.h,) ,       
                CustomButton(
                onTap: () {
                 
                },
                text: "Save Address",
              )   
              ],
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}


