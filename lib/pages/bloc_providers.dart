import 'package:flutter_bloc/flutter_bloc.dart';

import 'register/bloc/register_blocs.dart';
import 'sign_in/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_blocs.dart';

class AppBlocProviders{
  static get allBlocProviders=>[
    BlocProvider(lazy:false, create: (context) => WelcomeBloc(),),
    BlocProvider(create: (context) => SignInBloc(),),
    BlocProvider(create: (context) => RegisterBlocs(),),
  ];
}