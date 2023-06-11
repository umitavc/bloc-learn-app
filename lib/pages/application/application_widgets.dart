
import 'package:bloc_learn_app/pages/application/settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    //HomeScreen(),
     Center(child: Text('application.home'.tr())),
     Center(child: Text('application.search'.tr())),
     Center(child: Text('application.course'.tr())),
     Center(child: Text('application.chat'.tr(),)),
     SettingsPage(),

  ];

  return _widget[index];
}


var bottomTabs =  [
    BottomNavigationBarItem(icon: const Icon(Icons.home,),
            label: 'application.home'.tr(),
            //activeIcon: Icon(Icons.home_outlined)
            ),
             BottomNavigationBarItem(icon: const Icon(Icons.search,),
            label: 'application.search'.tr(),
            
            ),
             BottomNavigationBarItem(icon: const Icon(Icons.play_arrow_rounded,),
            label: 'application.course'.tr(),
            ),
             BottomNavigationBarItem(icon: const Icon(Icons.chat,),
            label: 'application.chat'.tr(),
            ),
            BottomNavigationBarItem(icon: const Icon(Icons.person,),
            label: 'application.profil'.tr(),
            ),
];