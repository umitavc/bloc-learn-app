import 'package:bloc_learn_app/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String name) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Colors.grey.withOpacity(0.5),
        )),
    title: Text(
      
      name,
      style: TextStyle(color: AppColors.textColor, fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildThirdPartLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h,bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("apple"),
        _reusableIcons("facebook"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      //color: Colors.grey,
      height: 40.w,
      width: 40.w,
      child: Image.asset("assets/icons/${iconName}.png"),
    ),
  );
}

Widget loginreusableText(String text) {
  return Container(
    margin: EdgeInsets.only(left: 24.h, top: 25.h),
    child: Text(
      text,
      style: TextStyle(color: AppColors.subTitleTextColor, fontWeight: FontWeight.w600, fontSize: 24.sp),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(color: AppColors.subTitleTextColor, fontWeight: FontWeight.w600, fontSize: 14.sp),
    ),
  );
}


Widget subTitleReusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 64.h,right: 55,left: 55),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColors.subTitleTextColor, fontWeight: FontWeight.w400, fontSize: 16.sp),
    ),
  );
}

Widget buildTextField(String hintText, String TextType,


void Function(String value)? func

) {
  return Container(
      width: 325.w,
      height: 50.w,
      margin: EdgeInsets.only(bottom: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Container(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) => func!(value),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              ),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14.sp),
              autocorrect: false,
              obscureText: TextType == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forget password ?",
        style: TextStyle(
          color: AppColors.buttonColor,
        ),
      ),
    ),
  );
}

// Widget dontSignUp() {
//   return Container(
//       margin: EdgeInsets.only(top: 19.h),
//       child: Center(
//         child: RichText(
//           text: TextSpan(text: 'Don\'t have an account?', style: TextStyle(color: Colors.black, fontSize: 12), children: <TextSpan>[TextSpan(text: ' Sign up', style: TextStyle(color: AppColors.buttonColor, fontSize: 12), recognizer: TapGestureRecognizer()..onTap = () {})]),
//         ),
//       ));
// }

// Widget orWidget() {
//   return Center(
//     child: Container(
//       margin: EdgeInsets.only(top: 30.h),
//       child: Text(
//         "OR",
//         style: TextStyle(color: AppColors.subTitleTextColor, fontWeight: FontWeight.w600, fontSize: 14.sp),
//       ),
//     ),
//   );
// }

Widget buildLogInAdnRegButton(
  String buttonName,
  String buttonType,
  void Function()? funct
) {
  return GestureDetector(
    onTap: funct,
    child: Container(
        margin: EdgeInsets.only(top:buttonType=="login"?40.h:20.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(color: buttonType=="login"?AppColors.buttonColor:AppColors.button2Color, borderRadius: BorderRadius.circular(10.w),
         border: Border.all(color: buttonType=="login"?Colors.transparent:AppColors.textColor),
         
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 2, offset: const Offset(0, 1))]),
        child: Center(
            child: Center(
              child: Text(
                buttonName,
                  style: TextStyle(
                    color:  buttonType=="login"?Colors.white:AppColors.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
            ))),
  );
}

// Widget buildAppleRegButton(BuildContext context, String buttonName, String iconName) {
//   return GestureDetector(
//     onTap: () {
//       Navigator.of(context).pushNamedAndRemoveUntil("signUp" ,(route) => false);
//     },
//     child: Center(
//       child: Container(
//           margin: EdgeInsets.only(top: 20.h, left: 25.w, right: 25.w),
//           width: 222.w,
//           height: 50.h,
//           decoration: BoxDecoration(color: AppColors.button2Color, borderRadius: BorderRadius.circular(10.w), border: Border.all(color: Colors.black), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 2, offset: const Offset(0, 1))]),
//           child: Center(
//               child: Row(
//             children: [
//               Container(
//                 width: 19.w,
//                 height: 25.h,
//                 margin: EdgeInsets.only(left: 26.w,right:15.w ),
//                 child: SvgPicture.asset("assets/svg/$iconName.svg"),
//               ),
//               Text(buttonName,
//                   style: TextStyle(
//                     color: AppColors.buttonTextColor,
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.w600,
//                   )),
//             ],
//           ))),
//     ),
//   );
// }

Widget sozlesmeText() {
  return Container(
    
      margin: EdgeInsets.only(top: 36.h,right: 100.w,left: 100.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          
          text: 'By continuing you agree to our\n ', style: TextStyle(color: AppColors.subTitleColor, fontSize: 10), children:[TextSpan(
          text: 'Term and Conditions ', 

          style: const TextStyle(
          fontSize: 10,
          decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()..onTap = () {}),


          const TextSpan(
          text: 'and ', 
          style: TextStyle( fontSize: 10),
           ),

          TextSpan(
          text: 'Privacy Policy', 
          style: const TextStyle( fontSize: 10,decoration: TextDecoration.underline),
           recognizer: TapGestureRecognizer()..onTap = () {})
           
           
           ]),
      ));
}
