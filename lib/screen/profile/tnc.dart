import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';

class TPL extends StatelessWidget {
  const TPL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        surfaceTintColor: ColorConstants.whiteColor,
        title: Text(
          "Legal Policies ",
          style: AppStyle.heading16Text.copyWith(fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Text(" Terms and Conditions Policy",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(10),
               child: Text("Welcome to App These terms and conditions outline the rules and regulations for the use of App Website.\n"
                   "\nBy accessing this website we assume you accept these terms and conditions in full. Do not continue to use (Store Name)’s website if you do not accept all of the terms and conditions stated on this page.\n"
                   "\nThe following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and any or all Agreements: Client, You and Your refers to you, the person accessing this website and accepting the Company’s terms and conditions. The Company, Ourselves, We, Our and Us, refers to our Company. Party, Parties, or Us, refers to both the Client and ourselves, or either the Client or ourselves\n"
                   "\nAny use of the above terminology or other words in the singular, plural, capitalisation and/or he/she or they, are taken as interchangeable and therefore as referring to same.\n"
                   ),
            ),
            Text(" Cookies ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(10),
            child: Text("We employ the use of cookies. By using (Store Name)’s website you consent to the use of cookies in accordance with (Store Name)’s privacy policy. Most of the modern day interactive websites use cookies to enable us to retrieve user details for each visit.\n"
    
            ),
            ),
            Text("Licence ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(10),
            child: Text("Unless otherwise stated,App and/or its licensors own the intellectual property rights for all material on App.\n"
                "\nAll intellectual property rights are reserved. You may view and/or print pages from (Add URL) for your own personal use subject to restrictions set in these terms and conditions\n"),
            ),
            Text("Disclaimer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(10),
              child: Text("To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website (including, without limitation, any warranties implied by law in respect of satisfactory quality, fitness for purpose and/or the use of reasonable care and skill).\n"
                  ),
            ),
            Text("Thanks",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}
