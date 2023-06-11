import 'package:bloc_learn_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_learn_app/service/global.dart';
import 'package:bloc_learn_app/utils/constant.dart';
import 'package:bloc_learn_app/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({
    required this.context,
  });
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "you need to fill email address");
          return;

        }
        if (password.isEmpty) {
          toastInfo(msg: "you need to fill password ");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password
             );
             if (credential.user==null) {
              toastInfo(msg: "you dont exit ");
              return;
             }
             //(!credential.user!.emailVerified) aşağı ile değiştirdim
             if (credential.user!.emailVerified) {
               toastInfo(msg: "you  need to verify yoru email account app");
               return;
             }
             var user = credential.user;
             if (user!=null) {
               print("user exit");
               Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
               Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
             }else{
              toastInfo(msg: "Currently you are not a user of this ");
              return;
             }
        } on FirebaseAuthException catch (e) {
          if (e.code =="user-not-found") {
            print("No user found for that email.");
            toastInfo(msg: "No user found for that email");

          }else if(e.code =="wrong-password"){
            print("Worng password provided for that user.");
            toastInfo(msg: "Wrong password provided for that user");

          }else if(e.code == "invalid-email"){
            print("your email format is worng");
            toastInfo(msg: "your email address format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
