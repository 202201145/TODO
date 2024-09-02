import 'package:flutter/material.dart';
import 'package:todolist3/home/Settings/settings.dart'; // Import SettingsTab
import 'package:todolist3/home/appColors.dart';
import 'package:todolist3/home/task_list/Add_TaskButtonSheet.dart';
import 'package:todolist3/home/task_list/task_list1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  homeScreenState createState() => homeScreenState();
}

class homeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        centerTitle: true,
        title: Text(
          selectedIndex == 0
              ? AppLocalizations.of(context)!.app_title
              : AppLocalizations.of(context)!.settings,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        height: 84,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: AppLocalizations.of(context)!.task_list,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskbuttonsheet();
        },
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(
          side: BorderSide(color: AppColors.whiteColor, width: 4),
        ),
        child: const Icon(
          Icons.add,
          size: 35,
          color: AppColors.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: selectedIndex == 0
          ? TaskList1() // Fix potential overflow issue
          : SettingsTab(), // Use SettingsTab for settings screen
    );
  }

  void showAddTaskbuttonsheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskbuttonsheet());
  }
}
