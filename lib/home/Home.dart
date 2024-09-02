import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist3/home/appColors.dart';

class EditTaskScreen extends StatefulWidget {
  final String title;
  final String description;

  const EditTaskScreen({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    descriptionController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'ENTER TASK TITLE',
                      ),
                      style: const TextStyle(
                          color: AppColors.blackColor, fontSize: 20),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please Enter Task Title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    // Add space between title and description
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          hintText: 'ENTER TASK DESCREBYION ',
                          suffixIconColor: AppColors.primaryColor),
                      style: const TextStyle(
                          color: AppColors.blackColor, fontSize: 20),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'please Enter Task Description';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Add space between form and "Select time"
              const Text(
                'Select time',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                child: const Text(
                  '27-6-2021',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle saving changes here
                    }
                  },
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
