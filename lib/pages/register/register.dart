


import 'package:bloc_learn_app/pages/common_widgets.dart';
import 'package:bloc_learn_app/pages/register/bloc/register_blocs.dart';
import 'package:bloc_learn_app/pages/register/bloc/register_events.dart';
import 'package:bloc_learn_app/pages/register/bloc/register_states.dart';
import 'package:bloc_learn_app/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   @override
  Widget build(BuildContext context) {
    
      return BlocBuilder<RegisterBlocs,RegisterStates>(builder: (context, state) {
        return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Sign Up"),
        body: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(child: reusableText("Enter your details below & free sign up")),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                //padding: EdgeInsets.only(left: 25.w),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User name"),
                      buildTextField("Enter your user name","email",
                      (value){
                        context.read<RegisterBlocs>().add(UserNameEvent(value));
                      }
                      ),
                      reusableText("Email"),
                      buildTextField("Enter your email address","email",
                      (value){
                        context.read<RegisterBlocs>().add(EmailEvent(value));
                      }
                      ),
                      reusableText("Password"),
                      buildTextField("Enter yoru Password","password",
                      (value){
                        context.read<RegisterBlocs>().add(PasswordEvent(value));
                      }
                      ),
                       reusableText("Confirm Password"),
                      buildTextField("Enter you confirm password","password",
                      (value){
                        context.read<RegisterBlocs>().add(RePasswordEvent(value));
                      }
                      ),
                      reusableText("By creating an account you have to agree \n with our &condication"),
                      
                  
                      
                       buildLogInAdnRegButton("Sign Up","login" , () {
                         //Navigator.of(context).pushNamed("register");
                         RegisterController(context:context).handleEmailRegister();
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
  

