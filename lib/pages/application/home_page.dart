// screens/home_screen.dart

import 'package:bloc_learn_app/pages/application/settings.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home.title').tr(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('home.message').tr(),
            const SizedBox(height: 20),
            Text(
              'home.current_locale'.tr(),
            ),
            const SizedBox(height: 20),
            Text(
              'home.color'.tr(),
            )
          ],
        ),
      ),
    );
  }
}
