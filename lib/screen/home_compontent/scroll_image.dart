import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollImage extends StatelessWidget {
  const ScrollImage({super.key, required this.image,  this.reduis});
  final String image;
  final bool? reduis;
  @override
  Widget build(BuildContext context) {
    return  Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(reduis==true?15.r:0),
        image: DecorationImage(
          image:AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}