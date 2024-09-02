import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist3/home/Settings/ThemesButtomSheet.dart';
import 'package:todolist3/home/appColors.dart';
import 'package:todolist3/providers/app_config_proider.dart';
import 'LanguageButtomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.primaryColor)),
          SizedBox(height: height * .02),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.mode,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.primaryColor)),
          SizedBox(height: height * 0.02),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: InkWell(
              onTap: () {
                showThemesBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  provider.appTheme == ThemeMode.light
                      ? getSelectedItemWidget(
                          AppLocalizations.of(context)!.light,)
                      : getUnSelectedItemWidget(
                          AppLocalizations.of(context)!.dark),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Container(
            height: 2.0,
            color: AppColors.whiteColor, // Adjust the color as needed
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageButtomSheet(),
        isScrollControlled: true // Allow scrolling if necessary
        );
  }

  void showThemesBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeButtomSheet());
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
    );
  }
}
