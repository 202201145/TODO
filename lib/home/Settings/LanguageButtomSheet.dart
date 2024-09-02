import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist3/home/appColors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/app_config_proider.dart';

class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.all(8.5),
            child: InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.english),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.5),
              child: InkWell(
                  onTap: () {
                    provider.changeLanguage('ar');
                  },
                  child: provider.appLanguage == 'ar'
                      ? getSelectedItemWidget(
                          AppLocalizations.of(context)!.arabic)
                      : getUnSelectedItemWidget(
                          AppLocalizations.of(context)!.arabic))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ]),
      ),
    );
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
            color: AppColors.primaryColor,
          ),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: AppColors.primaryColor,
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
