import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mult_language_application/blocs/cubit/changes_languages_cubit.dart';
import 'package:mult_language_application/common/utils/languages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'blocs/cubit/changes_languages_state.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ChangesLanguagesCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangesLanguagesCubit, ChangesLanguagesState>(
        builder: (context, state) {
      return MaterialApp(
        locale: state.localeLanguage,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Languages.languages,
        title: 'Multi Languages Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ChangesLanguagesCubit changeLanguagesCubit =
              context.read<ChangesLanguagesCubit>();
          Locale getLocalLanguage = changeLanguagesCubit.state.localeLanguage;
          changeLanguagesCubit.changeLanguage(
              localeLanguage: getLocalLanguage == const Locale('en')
                  ? const Locale('hi')
                  : const Locale('en'));
          debugPrint("\n\nThe multilanguage is displayed\n\n");
        },
        child: const Icon(Icons.change_circle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${AppLocalizations.of(context)?.language}",
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context)?.name}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  "${AppLocalizations.of(context)?.personName}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context)?.age}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  "${AppLocalizations.of(context)?.personAge}",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
