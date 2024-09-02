import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist3/home/appColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Home.dart';

class Tasklistitem extends StatefulWidget {
  const Tasklistitem({super.key});

  @override
  State<Tasklistitem> createState() => _TasklistitemState();
}

class _TasklistitemState extends State<Tasklistitem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Slidable(
        key: const ValueKey(0),

        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          // ... other code ...
          children: [
            // Remove 'const' from here
            SlidableAction(
              onPressed: (context) {
                // Handle delete action here
              },
              backgroundColor: AppColors.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            // Remove 'const' from here as well
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: AppLocalizations.of(context)!.share,
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            editTask();
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: 4,
                  color: AppColors.primaryColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.check,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editTask() {
    showModalBottomSheet(
      context: context,
      builder: (context) => EditTaskScreen(
        title: '',
        description: ''
            '',
      ),
    );
  }
}
