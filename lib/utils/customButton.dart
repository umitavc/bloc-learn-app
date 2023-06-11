import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({super.key, 
  required this.buttonName,
  required this.Color,
  
  });

  final String buttonName;
  bool Color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushNamedAndRemoveUntil("signUp", (route) => false);
      },
      child: Center(
        child: Container(
            margin: EdgeInsets.only(top: 20.h, left: 42.w, right: 42.w),
            width: 344.w,
            height: 50.h,
            decoration: BoxDecoration(color: Color? AppColors.buttonColor:Colors.blue, borderRadius: BorderRadius.circular(10.w), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 2, offset: const Offset(0, 1))]),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(buttonName,
                    style: TextStyle(
                      color: AppColors.buttonTextColorWhite,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ))),
      ),
    );
  }
}
