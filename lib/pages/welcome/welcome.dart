
import 'package:bloc_learn_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_learn_app/pages/welcome/bloc/welcome_events.dart';

import 'package:bloc_learn_app/pages/welcome/bloc/welcome_states.dart';
import 'package:bloc_learn_app/service/global.dart';
import 'package:bloc_learn_app/utils/colors.dart';
import 'package:bloc_learn_app/utils/constant.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Welcome extends StatefulWidget {
  Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  //final index = PageController();
  PageController pageController =PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  //controller: index,
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "Next",
                      "Welcome !",
                      "Whereas disregard and contempt for human rights have resulted",
                      "assets/svg/welcome.svg",
                    ),
                    _page(
                      2,
                      context,
                      "Next",
                      "Meet with New Friends",
                      "Whereas disregard and contempt for human rights have resulted",
                      "assets/svg/welcome2.svg",
                    ),
                    _page(
                      3,
                      context,
                      "Let's start",
                      "Find your game Friends!",
                      "Whereas disregard and contempt for human rights have resulted",
                      "assets/svg/online_gaming.svg",
                    ),
                    
                  ],
                ),
                Positioned(
                  bottom: 180.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment:MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: AppColors.buttonColor,
                      //shape: Border(),
                      size: const Size.square(11.0),
                      activeSize: const Size(23, 8),activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                    ),

                    ),

                  // child: SmoothPageIndicator(
                  //   controller: index,
                  //   count: 3,
                  //   axisDirection: Axis.horizontal,
                  //   effect: SlideEffect(
                  //       spacing: 4.0,
                  //       radius: 4.0,
                  //       dotWidth: 11.0,
                  //       dotHeight: 3.0,
                  //       //paintStyle: PaintingStyle.stroke,

                  //       strokeWidth: 1.5,
                  //       dotColor: Colors.grey,
                  //       activeDotColor: AppColors.buttonColor),
                  // ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title, String subTile, String imagePath) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
            )),
        Container(
          child: Text(
            title,
            style: TextStyle(color: AppColors.textColor, fontSize: 24.sp, fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTile,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.subTitleTextColor,
              fontSize: 16.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index<3) {
              pageController.animateToPage(
                index, 
                duration: const Duration(milliseconds: 500),
                 curve: Curves.easeIn
                );
            }else{
             // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MyHomePage()));
             Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
             //print("the value is ${Global.storageService.getDeviceFirstOpen()}");
             Navigator.of(context).pushNamedAndRemoveUntil("/sign_in" ,(route) => false);
            }
          },
          child: Container(
              margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
              width: 344.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.w),
                  ),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius: 20, offset: const Offset(0, 1))]),
              child: Center(child: Text(buttonName, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal)))),
        )
      ],
    );
  }
}
