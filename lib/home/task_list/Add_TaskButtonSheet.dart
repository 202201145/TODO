import 'package:flutter/material.dart';
import 'package:todolist3/home/appColors.dart';

class AddTaskbuttonsheet extends StatefulWidget {
  const AddTaskbuttonsheet({super.key});

  @override
  State<AddTaskbuttonsheet> createState() => _AddTaskbuttonsheetState();
}

class _AddTaskbuttonsheetState extends State<AddTaskbuttonsheet> {
  final formKey = GlobalKey<FormState>();
  var selectDate = DateTime.now();
  String title = '';

  String descrebtion = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Text(
              'Add New Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'ENTER TASK TITLE',
                        ),
                        style: const TextStyle(
                            color: AppColors.blackColor, fontSize: 20),
                        onChanged: (text) {
                          title = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'please Enter Task Title';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'ENTER TASK DESCREBYION ',
                              suffixIconColor: AppColors.primaryColor),
                          style: const TextStyle(
                              color: AppColors.blackColor, fontSize: 20),
                          onChanged: (text) {
                            descrebtion = text;
                          },
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please Enter Task Description';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Select Date ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColors.BackgroundDarkColor),
              ),
            ),
            Center(
                child: InkWell(
                    onTap: () {
                      ShowCalender();
                    },
                    child: Text(
                        "${selectDate.day}/${selectDate.month}/${selectDate.year}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.BackgroundDarkColor)))),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: const Text('Add',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.primaryColor),
                ),
              ),
            )
          ])),
    );
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      return;
    }
  }

  void ShowCalender() async {
    var Choossen = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (Choossen != null) {
      selectDate = Choossen;
      setState(() {});
    }
  }
}
