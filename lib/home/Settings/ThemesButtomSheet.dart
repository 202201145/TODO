import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolist3/home/appColors.dart';
import 'package:todolist3/providers/app_config_proider.dart';

class ThemeButtomSheet extends StatefulWidget {
  const ThemeButtomSheet({super.key});

  @override
  State<ThemeButtomSheet> createState() => _ThemeButtomSheetState();
}

class _ThemeButtomSheetState extends State<ThemeButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.all(8.5),
                child: InkWell(
                  onTap: () {
                    provider.changeTheme(ThemeMode.light);
                  },
                  child: provider.appTheme == ThemeMode.light
                      ? getSelectedItemWidget(
                          AppLocalizations.of(context)!.light)
                      : getUnSelectedItemWidget(
                          AppLocalizations.of(context)!.light),
                )),
            Padding(
              padding: EdgeInsets.all(8.5),
              child: InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.dark);
                },
                child: provider.appTheme == ThemeMode.dark
                    ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.dark),
              ),
            ),
          ],
        ),
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
