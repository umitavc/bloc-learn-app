import 'package:bloc_learn_app/pages/bloc/language_bloc.dart';
import 'package:bloc_learn_app/routers/routers.dart';
import 'package:bloc_learn_app/service/global.dart';
import 'package:bloc_learn_app/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    BlocProvider<TranslationBloc>(
      create: (context) => TranslationBloc(),
      child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: AppColors.textColor), elevation: 0, backgroundColor: Colors.white)),
            //home: Welcome(),
            onGenerateRoute: AppPages.GenerataRouteSettings,
            //initialRoute: "/",
            //Welcome(),
            // routes: {

            //   "signIn": (context) => const SignIn(),
            //   "register": (context) => const Register(),
            // },
          ),
        ));
  }
}
