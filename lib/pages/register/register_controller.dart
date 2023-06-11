import 'package:bloc_learn_app/pages/register/bloc/register_blocs.dart';
import 'package:bloc_learn_app/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state =context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email =state.email;
    String password =state.password;
    String rePassword =state.rePassword;

    if(userName.isEmpty){
      toastInfo(msg: "user Name can not be empty");
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: "email can not be empty");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "password can not be empty");
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: "repassword can not be empty");
      return;
    }

    try {
      

      final credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
        );
      if (credential.user!=null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An email has been sent to your registered email yo activate it please check your email");
        Navigator.of(context).pop();
      }

    } on FirebaseAuthException catch (e) {
      if (e.code =="weak-password") {
        toastInfo(msg: "The password provided is too weak");
      }else{
        if (e.code =="email-already-in-use") {
        toastInfo(msg: "The email is already in use");
      }else if(e.code =="invalid-email"){
        toastInfo(msg: "yoru email id is invalid");
      }
      }
    }


    

  }
}