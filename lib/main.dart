import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist3/providers/app_config_proider.dart';
import 'home/HomeScreen.dart';
import 'home/My_Themes_Data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main (){
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: Todolist()));
}

class Todolist extends StatelessWidget {
  const Todolist({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: my_theme_Data.lightTheme,
      darkTheme: my_theme_Data.DarkTheme,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}