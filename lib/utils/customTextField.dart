import 'package:bloc_learn_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, required this.hintText, required this.textType});

final String hintText;
final String textType;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 380.w,
      height: 41.w,
      margin: EdgeInsets.only(bottom: 20.w, left: 24.w,right: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        border: Border.all(color: Color(0xFFE9E9E9)),
      ),
      child: Row(
        children: [
          Container(
            width: 280.w,
            height: 50.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: TextStyle(color: AppColors.subTitleTextColor),
              ),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16.sp),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          )
        ],
      ));
  }
}