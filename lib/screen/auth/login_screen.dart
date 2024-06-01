
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


import '../../common/constant/color.dart';
import '../../common/constant/font_style.dart';
import '../../common/widget/common_button.dart';
import '../../common/widget/common_textfield.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  TextEditingController controller=TextEditingController();
  bool error=false;
  FocusNode mobileFocus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical:0.h),
        child: Column(
          children: [
            Text("Enter your mobile number to get OTP",style: AppStyle.blackDarkColor20text.copyWith(fontSize: 30.sp,),),
            SizedBox(height: 20.h,),
            IntlPhoneField(
              flagsButtonMargin: const EdgeInsets.only(left: 10),
              controller: controller,
              // disableLengthCheck: true,
              showCountryFlag: false,
              showDropdownIcon: false,
              // dropdownIconPosition: IconPosition.trailing,
              // dropdownIcon: Icon(Icons.arrow_drop_down_rounded, color:  ColorConstants.greyColor,),
              dropdownTextStyle: TextStyle(
                  color:Colors.black87,fontSize: 15.sp,fontWeight: FontWeight.w500
              ),
              cursorColor:  ColorConstants.themeColor,
              focusNode:mobileFocus,
              onSaved: (val){
                if(controller.text.length==10)
                {
                  mobileFocus.unfocus();
                }
                setState(() {
                });
              },
              style:  TextStyle(
                  color:ColorConstants.blackColor,fontSize: 15.sp,fontWeight: FontWeight.w500
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 10.w),
                hintText:"10 digit mobile number",
                hintStyle: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color:  ColorConstants.greyColor,
                ),
                errorStyle:  TextStyle(
                    color: Colors.red,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide:  const BorderSide(color:ColorConstants.themeColor,width: 1.5),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide:  const BorderSide(color:ColorConstants.themeColor,width: 1.5),
                ),
                errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide:  const BorderSide(color: Colors.red,width: 1.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide:  const BorderSide(color:ColorConstants.themeColor,width: 1.5),
                ),
                focusedErrorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color:ColorConstants.themeColor,width: 1.5),
                ),
              ),
              pickerDialogStyle: PickerDialogStyle(
                backgroundColor: ColorConstants.whiteColor,
                searchFieldCursorColor: ColorConstants.themeColor,
               searchFieldInputDecoration: InputDecoration(
                 suffixIcon: Icon(Icons.search,size: 20.sp,color:  ColorConstants.greyColor),
                 labelText:"Search country",
                 labelStyle: GoogleFonts.dmSans(
                   fontSize: 14.sp,
                   fontWeight: FontWeight.w500,
                   color:  ColorConstants.greyColor,
                 ),
                 contentPadding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                 enabledBorder: UnderlineInputBorder(
                   borderSide:  BorderSide(color:ColorConstants.themeColor ),
                 ),
                 focusedBorder:  UnderlineInputBorder(
                   borderSide:  BorderSide(color:ColorConstants.themeColor),
                 ),
               )
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            SizedBox(height: 20.h,),
            CustomButton(onTap: () {
              // signInwithGoogle();
              Get.offAll(() => OTPScreen());

            },text: "Get OTP",),
            SizedBox(height: 10.h,),
            Text.rich(TextSpan(text: 'By clicking, I accept the ',style: AppStyle.black54Color12Text,
              children: [
                TextSpan(text: 'terms of service',style: AppStyle.black54Color12Text.copyWith(fontWeight: FontWeight.w600,decoration: TextDecoration.underline,decorationThickness: 2,decorationColor: Colors.black54)),
                TextSpan(text: ' and ',style: AppStyle.black54Color12Text),
                TextSpan(text: 'privacy policy',style: AppStyle.black54Color12Text.copyWith(fontWeight: FontWeight.w600,decoration: TextDecoration.underline,decorationThickness: 2,decorationColor: Colors.black54)),
              ]

            ))
          ],
        ),
      ),
    );
  }
  // Future signInwithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //     await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //     await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     await _auth.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     print("Error $e ");
  //   }
  // }
}
