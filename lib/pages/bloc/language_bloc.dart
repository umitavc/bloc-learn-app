import 'package:bloc_learn_app/models/language/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TranslationBloc extends Bloc<Language, Locale> {
  TranslationBloc() : super(const Locale('en', 'US')) {
    on<Language>((event, emit) {
      switch (event) {
        case Language.English:
          emit(const Locale('en', 'US'));
          break;
        case Language.Turkish:
          emit(const Locale('tr', 'TR'));
          break;
      }
    });
  }
}