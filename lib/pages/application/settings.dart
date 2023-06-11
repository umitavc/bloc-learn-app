// screens/settings_page.dart

import 'package:bloc_learn_app/models/language/language.dart';
import 'package:bloc_learn_app/pages/bloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings.title').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('application.profil').tr(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<TranslationBloc>().add(Language.English);
                context.setLocale(const Locale('en', 'US'));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TranslationBloc>().add(Language.Turkish);
                context.setLocale(const Locale('tr', 'TR'));
              },
              child: const Text('Türkçe'),
            ),
          ],
        ),
      ),
    );
  }
}
