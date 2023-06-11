import 'package:bloc_learn_app/pages/application/application_page.dart';
import 'package:bloc_learn_app/pages/register/bloc/register_blocs.dart';
import 'package:bloc_learn_app/pages/register/register.dart';
import 'package:bloc_learn_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_learn_app/pages/sign_in/sign_in.dart';
import 'package:bloc_learn_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_learn_app/routers/names.dart';
import 'package:bloc_learn_app/service/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/application/bloc/app_bloc.dart';
import '../pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(route: AppRouters.INITIAL, page: Welcome(), bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(route: AppRouters.SING_IN, page: const SignIn(), bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(route: AppRouters.REGISTER, page: const Register(), bloc: BlocProvider(create: (_) => RegisterBlocs())),
      PageEntity(route: AppRouters.APPLICATION, page: ApplicationPage(), bloc: BlocProvider(create: (_) => AppBlocs())),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerataRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRouters.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if(isLoggedin){
            return MaterialPageRoute(builder: (_)=>const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(builder: (_) => result.first.page, settings: settings);
      }
    }
    //print("invalid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
