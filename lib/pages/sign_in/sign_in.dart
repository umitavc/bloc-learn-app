import 'package:bloc_learn_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_learn_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_learn_app/pages/sign_in/bloc/signin_state.dart';
import 'package:bloc_learn_app/pages/sign_in/sign_in_controller.dart';

import 'package:bloc_learn_app/pages/common_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc,SignInState>(builder: (context, state) {
      return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Sign in"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartLogin(context),
              Center(child: reusableText(" or our your email account login")),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                //padding: EdgeInsets.only(left: 25.w),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      buildTextField("Email","email",
                      (value){
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }
                      ),
                      reusableText("Password"),
                      buildTextField("Password","password",
                      (value){
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      }
                      ),
                      forgotPassword(),
                  
                      buildLogInAdnRegButton("Log in","login", () {
                        //print("Login button");
                        SignInController(context: context).handleSignIn("email");
                      }, ),
                       buildLogInAdnRegButton("Sign Up","register" , () {
                         Navigator.of(context).pushNamed("/register");
                       },)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
    },);
  }
}
