
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/screen/profile/profile_screen.dart';



import '../common/constant/color.dart';
import 'cart/cart_screen.dart';
import 'category/category_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';

class BottomBar extends StatefulWidget {
  final int index;
  const BottomBar({super.key, required this.index});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  int _selectedIndex=0;
  final List<Widget>_list=[
    HomeScreen(),
    CartScreen(),
    CategoryScreen(),
    NotificationScreen(),
    Profile(),

  ];
  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex=widget.index;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: DotNavigationBar(
          enablePaddingAnimation: false,
          duration:const Duration(milliseconds: 700),
          marginR : EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          paddingR : EdgeInsets.only(bottom: 10.h, top: 10),
          currentIndex: _selectedIndex,
          dotIndicatorColor: ColorConstants.themeColor,
          unselectedItemColor: Colors.grey,
          splashBorderRadius: 50,
          enableFloatingNavBar: false,
          onTap: _onItemTapped,
          items: [
            /// Home
            DotNavigationBarItem(
              icon:const Icon(CupertinoIcons.home),
              selectedColor: ColorConstants.themeColor,
            ),

            /// Likes
            DotNavigationBarItem(
              icon:const Icon(CupertinoIcons.shopping_cart),
              selectedColor: ColorConstants.themeColor,
            ),
            DotNavigationBarItem(
              icon: Icon(CupertinoIcons.circle_grid_3x3,),
              selectedColor: ColorConstants.themeColor,
            ),
            /// Search
            DotNavigationBarItem(
              icon:const Icon(CupertinoIcons.bell),
              selectedColor: ColorConstants.themeColor,
            ),

            /// Profile
            DotNavigationBarItem(
              icon:const Icon(CupertinoIcons.person_crop_circle),
              selectedColor: ColorConstants.themeColor,
            ),
          ],
        ),
      ) ,

      body: _list[_selectedIndex],
    );
  }
}
