import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pravaah_ecommerce/common/constant/color.dart';
import 'package:pravaah_ecommerce/common/constant/font_style.dart';
import 'package:pravaah_ecommerce/common/widget/common_button.dart';
import 'package:pravaah_ecommerce/common/widget/common_textfield.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool home;
  final Color ?color;
  const CustomAppBar({super.key, required this.home,  this.color});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(45.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  String dropdownvalue = 'New Arrivals';

  String? selectedValue;

  var selectRange = const RangeValues(0, 10000);

  TextEditingController _controllerPrice1 = TextEditingController();

  TextEditingController _controllerPrice2 = TextEditingController();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';
  TextEditingController _controller = TextEditingController();
  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          pauseFor: Duration(seconds: 4),
          onResult: (val) => setState(() {
            _controller.text = val.recognizedWords;
            _isListening = false;
           
          }),
          
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  var items = [
    'New Arrivals',
    'Recommended',
    'Top Choice',
    'Price Low to High',
    'Price High to Low',
  ];

  var size = [
    'One-Size',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
    'OXL',
    'XS',
    'XXS'
  ];

  var type = ["All", "Man", "Woman", "Boys", "Girls"];

  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(45.h),
      child: AppBar(
        surfaceTintColor: ColorConstants.lightWhiteColor,
        backgroundColor: ColorConstants.lightWhiteColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomTextField(
                controller: _controller,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                hintText: "Search ",
                fillStutes: true,
                fillColor: ColorConstants.whiteColor,
                borderColor: Colors.transparent,
                maxLines: 1,
                maxLength: 50,
                suffix: InkWell(
                  onTap: _listen,
                  child: AvatarGlow(
                    animate: _isListening,
                    glowColor:widget.color?? ColorConstants.themeColor,
                    duration: const Duration(milliseconds: 1000),
                    repeat: true,
                    child: const CircleAvatar(
                      backgroundColor: ColorConstants.whiteColor,
                      child: Icon(Icons.keyboard_voice_outlined,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widget.home ? 0 : 10.h,
            ),
            widget.home
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Container(
                      height: 35.h,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.slider_horizontal_3,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              width: widget.home ? 0 : 5.h,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(45.h);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            maxChildSize: 0.75,
            minChildSize: 0.45,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                    margin: EdgeInsets.all(10.sp),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: ColorConstants.whiteColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 5.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorConstants.greyColor),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Filter",
                                  style: AppStyle.blackW600text18,
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: ColorConstants.greyColor,
                                    ))
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Text.rich(TextSpan(children: [
                              for (int i = 0; i < type.length; i++)
                                WidgetSpan(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 5.h),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7.w, vertical: 3.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: Border.all(
                                            color: ColorConstants.greyColor)),
                                    child: Text(
                                      type[i],
                                      style: AppStyle.blackColor12boldText,
                                    ),
                                  ),
                                ))
                            ])),
                            SizedBox(height: 5.h),
                            Text("Sort by",
                                style: AppStyle.blackColor12boldText
                                    .copyWith(fontSize: 14.sp)),
                            SizedBox(height: 2.h),
                            DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Select',
                                  style: AppStyle.blackColor14TextBold,
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style:
                                                AppStyle.blackColor14TextBold,
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  width: double.maxFinite,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                    elevation: 1,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.whiteColor,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ))),
                            SizedBox(height: 7.h),
                            Text("By minimum start rating",
                                style: AppStyle.blackColor12boldText
                                    .copyWith(fontSize: 14.sp)),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 60.h,
                              child: ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3.h, horizontal: 10.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          border: Border.all(
                                              color: ColorConstants.greyColor),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: ColorConstants.greyColor,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              "${index + 1}",
                                              style: AppStyle
                                                  .blackColor14TextBold
                                                  .copyWith(
                                                      color: ColorConstants
                                                          .greyColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(height: 5.h),
                            Text("By Price",
                                style: AppStyle.blackColor12boldText
                                    .copyWith(fontSize: 14.sp)),
                            SizedBox(height: 5.h),
                            RangeSlider(
                              values: selectRange,
                              onChanged: (RangeValues newvalue) {
                                selectRange = newvalue;
                                _controllerPrice1.text =
                                    selectRange.start.toString();
                                _controllerPrice2.text =
                                    selectRange.end.toString();
                                setState(() {});
                              },
                              inactiveColor: ColorConstants.greyColor,
                              activeColor: ColorConstants.themeColor,
                              min: 0,
                              max: 10000,
                              divisions: 10,
                              labels: RangeLabels(
                                  '${selectRange.start}', '${selectRange.end}'),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: CustomTextField(
                                  prefix: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 5.w),
                                    child: Text(
                                      "\₹",
                                      style: AppStyle.blackColor14TextBold,
                                    ),
                                  ),
                                  controller: _controllerPrice1,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 0.w),
                                  height: 30.h,
                                )),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  "To",
                                  style: AppStyle.blackColor14TextBold,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    prefix: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 5.w),
                                      child: Text(
                                        "\₹",
                                        style: AppStyle.blackColor14TextBold,
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 0.w),
                                    controller: _controllerPrice2,
                                    height: 30.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text("By Size",
                                style: AppStyle.blackColor12boldText
                                    .copyWith(fontSize: 14.sp)),
                            SizedBox(height: 5.h),
                            Text.rich(TextSpan(children: [
                              for (int i = 0; i < size.length; i++)
                                WidgetSpan(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 5.h),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7.w, vertical: 3.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        border: Border.all(
                                            color: ColorConstants.greyColor)),
                                    child: Text(
                                      size[i],
                                      style: AppStyle.blackColor12boldText,
                                    ),
                                  ),
                                ))
                            ])),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 35.h,
                                    child: OutlinedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    side: const BorderSide(
                                                        color: ColorConstants
                                                            .themeColor)))),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Clear Filter",
                                          style: AppStyle.blackColor14TextBold
                                              .copyWith(
                                                  color: ColorConstants
                                                      .blackColor),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Expanded(
                                  child: CustomButton(
                                    buttonHeight: 35.h,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    text: "Apply Filter",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ],
                    )),
              );
            },
          );
        });
      },
    );
  }
}
